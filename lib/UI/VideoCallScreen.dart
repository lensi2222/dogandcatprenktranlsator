import 'dart:async';
import 'package:camera/camera.dart';
import 'package:dogandcatprenktranlsator/Resources/ColorResources.dart';
import 'package:dogandcatprenktranlsator/Resources/ImagesResources.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';
import '../main.dart';
import 'TakeVideoCallScreen.dart';

class VideoCallScreen extends StatefulWidget {
  String? video;
  String? image;

  String? title;

  VideoCallScreen({Key? key, this.video, this.title, this.image})
      : super(key: key);

  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen>
    with WidgetsBindingObserver {
  VideoPlayerController? _controller;
  Timer? _timer;
  int _secondsElapsed = 0;
  CameraController? cameraController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.video!)
      ..initialize().then((_) {
        _controller!.play();
        _controller!.setLooping(true);
        setState(() {});
      });
    cameraController = CameraController(cameras![0], ResolutionPreset.max);
    cameraController!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      startTimer();
    } else if (state == AppLifecycleState.paused) {
      _timer?.cancel();
    }
  }

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _secondsElapsed++;
      });
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    cameraController!.dispose(); // Dispose of the video controller
    _timer?.cancel();
    WidgetsBinding.instance
        .removeObserver(this); // Dispose of the camera controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int minutes = _secondsElapsed ~/ 60;
    int seconds = _secondsElapsed % 60;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: FittedBox(0
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller!.value.size?.width ?? 0,
                height: _controller!.value.size?.height ?? 0,
                child: VideoPlayer(_controller!),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 80,
            child: Container(
              width: 120.0, // Adjust the width as needed
              height: 170.0, // Adjust the height as needed
              child: Text(
                ' ${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: whiteColor),
              ),
            ),
          ),
          Positioned(
            top: 80,
            right: 20,
            child: Container(
              width: 120.0, // Adjust the width as needed
              height: 170.0, // Adjust the height as needed
              child: CameraPreview(cameraController!),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            left: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Positioned(
                  bottom: 20.0,
                  left: 20.0,
                  child: FloatingActionButton(
                    onPressed: () {
                      // Toggle between the front and rear camera
                      onSwitchCamera();
                    },
                    child: Icon(Icons.switch_camera),
                  ),
                ),
                Positioned(
                    bottom: 20.0,
                    left: 20.0,
                    child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return TakeVideoCallScreen(
                                image: widget.image,
                                title: widget.title,
                              );
                            },
                          ));
                        },
                        child: Image.asset(
                          callEndImg,
                          height: 10.h,
                          width: 20.w,
                        ))),
                Positioned(
                  bottom: 20.0,
                  left: 20.0,
                  child: FloatingActionButton(
                    onPressed: () {
                      // Toggle between the front and rear camera
                      // onSwitchCamera();
                    },
                    child: Icon(Icons.settings_voice_outlined),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onSwitchCamera() async {
    CameraDescription newCamera = cameraController!.description == cameras![0]
        ? cameras![1]
        : cameras![0];

    if (cameraController != null) {
      await cameraController!.dispose();
    }

    cameraController = CameraController(newCamera, ResolutionPreset.max);

    try {
      await cameraController!.initialize();
      setState(() {});
    } on CameraException catch (e) {
      debugPrint("Error initializing camera: $e");
    }
  }
}
