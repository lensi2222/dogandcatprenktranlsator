import 'package:dogandcatprenktranlsator/Resources/ColorResources.dart';
import 'package:dogandcatprenktranlsator/UI/InComingCallScreen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../CustomWidget/CountDownCustomClass.dart';

class TakeVideoCallScreen extends StatefulWidget {
  String? image;
  String? title;
  String? video;

  TakeVideoCallScreen({
    Key? key,
    this.title,
    this.image,
    this.video,
  }) : super(key: key);

  @override
  State<TakeVideoCallScreen> createState() => _TakeVideoCallScreenState();
}

class _TakeVideoCallScreenState extends State<TakeVideoCallScreen>
    with TickerProviderStateMixin {
  String timerListSelectedIndex = "0";
  bool showTimer = false;
  bool showImage = false;
  AnimationController? _controller;
  String durationInSeconds = "0";

  void startTimer(int seconds) {
    print('Starting timer for $seconds seconds');
    Future.delayed(Duration(seconds: seconds), () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return InComingCallScreen(
            video: widget.video,
            title: widget.title,
            image: widget.image,
          );
        },
      ));
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
          },
          icon: Icon(Icons.chevron_left,color: Colors.white,),
        ),
        title: Text("Overview"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 20.h,
              width: 50.w,
              child: Image.asset('${widget.image}'),
            ),
            Text(
              '${widget.title}',
              style: TextStyle(
                fontSize: 11.sp,
                color: Colors.black,
              ),
            ),
            Text(
              'Set Call after:',
              style: TextStyle(
                fontSize: 11.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20), // Added for spacing

            showImage == true
                ? AnimatedBuilder(
                    animation: _controller!,
                    builder: (context, child) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Text(
                          //   '${(_controller!.value * int.parse(durationInSeconds)).ceil()}',
                          //   style: TextStyle(fontSize: 48.0),
                          // ),
                          Countdown(
                            animation: StepTween(
                              begin: 0, // THIS IS A USER ENTERED NUMBER
                              end: int.parse(durationInSeconds),
                            ).animate(_controller!),
                          ),
                          const SizedBox(height: 20.0),
                          CircularProgressIndicator(
                            value: _controller!.value,
                            backgroundColor: Colors.grey,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(yellowColor),
                          ),
                        ],
                      );
                    },
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: timerList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            durationInSeconds = timerList[index];
                            print(
                                "---------------12-------------$durationInSeconds");
                            showTimer = true;
                            showImage = !showImage;
                          });
                          _controller = AnimationController(
                            vsync: this,
                            duration:
                                Duration(seconds: int.parse(durationInSeconds)),
                          );
                          _controller!.reverse(
                              from: _controller!.value == 0.0
                                  ? 1.0
                                  : _controller!.value);
                          int selectedSeconds = int.parse(timerList[index]);
                          startTimer(selectedSeconds);
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          height: 20,
                          width: 70,
                          color: Colors.grey.shade100,
                          child: Center(child: Text(timerList[index])),
                        ),
                      );
                    },
                  ),

            SizedBox(height: 20), // Added for spacing

            showImage == true
                ? SizedBox()
                : GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return InComingCallScreen(
                            video: widget.video,
                            title: widget.title,
                            image: widget.image,
                          );
                        },
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: yellowColor),
                      height: 40,
                      width: 40.w,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Take a video call",
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  // Dummy timer list for demonstration
  List<String> timerList = ['15', '30', '45', '60', '120', '300'];
}
