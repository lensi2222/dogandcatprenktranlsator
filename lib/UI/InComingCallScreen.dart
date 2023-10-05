import 'dart:async';
import 'dart:ui';
import 'package:dogandcatprenktranlsator/Resources/ImagesResources.dart';
import 'package:dogandcatprenktranlsator/UI/VideoCallScreen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vibration/vibration.dart';
import '../Resources/ColorResources.dart';

class InComingCallScreen extends StatefulWidget {
  String? image;
  String? title;
  String? video;

  InComingCallScreen({Key? key, this.title, this.image, this.video})
      : super(key: key);

  @override
  State<InComingCallScreen> createState() => _InComingCallScreenState();
}

class _InComingCallScreenState extends State<InComingCallScreen> {
  Timer? _vibrationTimer;
  int _vibrationDuration = 30000; // 30 seconds

  // Function to start and control vibration
  void startVibration() {
    _vibrationTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_vibrationDuration <= 0) {
        // Stop vibration after the specified duration
        stopVibration();
        timer.cancel(); // Cancel the timer
      } else {
        Vibration.vibrate(duration: 1000); // Vibrate for 1 second
        _vibrationDuration -= 1000; // Reduce the remaining duration
      }
    });
  }

  // Function to stop vibration
  void stopVibration() {
    Vibration.cancel();
  }

  @override
  void initState() {
    super.initState();

    // Start vibration when the screen is displayed
    startVibration();
  }

  @override
  void dispose() {
    // Cancel vibration and timer when the screen is disposed
    stopVibration();
    _vibrationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('${widget.image}'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                height: 10.h,
              ),
              Center(
                child: ClipOval(
                  child: Image.asset(
                    '${widget.image}',
                    height: 10.h,
                    width: 20.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                child: Text(
                  '${widget.title}',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: whiteColor,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Center(
                child: Text(
                  "Pets Translator",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: whiteColor,
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Center(
                child: Text(
                  'Incoming Video Call',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: whiteColor,
                  ),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      stopVibration();
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      callEndImg,
                      height: 8.h,
                      width: 20.w,
                    ),
                  ),
                  Container(
                    width: 30.w,
                  ),
                  GestureDetector(
                      onTap: () {
                        stopVibration();
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return VideoCallScreen(
                              video: widget.video,
                              title: widget.title,
                              image: widget.image,
                            );
                          },
                        ));
                      },
                      child: Image.asset(
                        callAnswerImg,
                        height: 10.h,
                        width: 15.w,

                      )),
                ],
              ),
              Container(
                height: 10.h,
              )
            ],
          ),
        ],
      ),
    );
  }
}
