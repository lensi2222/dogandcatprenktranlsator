import 'package:dogandcatprenktranlsator/Resources/ColorResources.dart';
import 'package:dogandcatprenktranlsator/UI/FakeCallScreen.dart';
import 'package:dogandcatprenktranlsator/UI/InComingCallScreen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../CustomWidget/CountDownCustomClass.dart';
import '../Resources/ImagesResources.dart';
import '../Resources/StringResources.dart';

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
      body: WillPopScope(
        onWillPop: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return const FakeCallScreen();
            },
          ));
          return Future.value(false);
        },
        child: SafeArea(
          child: Container(
            // height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(overViewBackGroundImg),
                    fit: BoxFit.fill)),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    // height: 60,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return const FakeCallScreen();
                                  },
                                ));
                              },
                              child: Image.asset(
                                drawerFakeCallImg,
                                height: 8.h,
                                width: 8.w,
                              )),
                        ),
                        Text(
                          fakeCallText,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: blackColor),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 20.h,
                        width: 50.w,
                        child: Image.asset(
                          godBackGroundImg,
                          height: 30.h,
                        ),
                      ),
                      Container(
                        height: 20.h,
                        width: 50.w,
                        child: Image.asset('${widget.image}'),
                      ),
                    ],
                  ),
                  Container(
                    height: 5.h,
                    width: 70.w,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(dogNameFrameImg),
                            fit: BoxFit.fill)),
                    child: Center(
                      child: Text(
                        '${widget.title}',
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
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
                                      AlwaysStoppedAnimation<Color>(redColor),
                                ),
                              ],
                            );
                          },
                        )
                      : Container(
                          height: 40.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300,
                                    spreadRadius: 2,
                                    blurRadius: 15)
                              ],
                              border: Border.all(color: redColor)),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: redColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                ),
                                height: 5.h,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      setCallImg,
                                      height: 3.h,
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Text(
                                      "Set Call After :",
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              // SizedBox(
                              //   height: 50,
                              //   child: ListView.builder(
                              //     physics: const NeverScrollableScrollPhysics(),
                              //     shrinkWrap: true,
                              //  itemCount: timerList.length,
                              //     itemBuilder: (context, index) {
                              //       return InkWell(
                              //         onTap: () {
                              //           setState(() {
                              //             durationInSeconds = timerList[index];
                              //             print(
                              //                 "---------------12-------------$durationInSeconds");
                              //             showTimer = true;
                              //             showImage = !showImage;
                              //           });
                              //           _controller = AnimationController(
                              //             vsync: this,
                              //             duration: Duration(
                              //                 seconds:
                              //                     int.parse(durationInSeconds)),
                              //           );
                              //           _controller!.reverse(
                              //               from: _controller!.value == 0.0
                              //                   ? 1.0
                              //                   : _controller!.value);
                              //           int selectedSeconds =
                              //               int.parse(timerList[index]);
                              //           startTimer(selectedSeconds);
                              //         },
                              //         child: Container(
                              //           margin: const EdgeInsets.all(10),
                              //           height: 20,
                              //           width: 40,
                              //           color: Colors.red,
                              //           child:
                              //               Center(child: Text(timerList[index])),
                              //         ),
                              //       );
                              //     },
                              //   ),
                              // ),
                              ...List.generate(
                                timerList.length,
                                (index) => GestureDetector(
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
                                      duration: Duration(
                                          seconds:
                                              int.parse(durationInSeconds)),
                                    );
                                    _controller!.reverse(
                                        from: _controller!.value == 0.0
                                            ? 1.0
                                            : _controller!.value);
                                    int selectedSeconds =
                                        int.parse(timerList[index]);
                                    startTimer(selectedSeconds);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      width: 20.w,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: redColor),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: Center(
                                          child: Text(
                                        "${timerList[index]}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      )),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                  SizedBox(height: 20),
                  // Added for spacing

                  //
                  //     : ListView.builder(
                  //         shrinkWrap: true,
                  //         itemCount: timerList.length,
                  //         itemBuilder: (context, index) {
                  //           return InkWell(
                  //             onTap: () {
                  //               setState(() {
                  //                 durationInSeconds = timerList[index];
                  //                 print(
                  //                     "---------------12-------------$durationInSeconds");
                  //                 showTimer = true;
                  //                 showImage = !showImage;
                  //               });
                  //               _controller = AnimationController(
                  //                 vsync: this,
                  //                 duration: Duration(
                  //                     seconds: int.parse(durationInSeconds)),
                  //               );
                  //               _controller!.reverse(
                  //                   from: _controller!.value == 0.0
                  //                       ? 1.0
                  //                       : _controller!.value);
                  //               int selectedSeconds = int.parse(timerList[index]);
                  //               startTimer(selectedSeconds);
                  //             },
                  //             child: Container(
                  //               margin: EdgeInsets.all(10),
                  //               height: 20,
                  //               width: 70,
                  //               color: Colors.grey.shade100,
                  //               child: Center(child: Text(timerList[index])),
                  //             ),
                  //           );
                  //         },
                  //       ),
                  //
                  SizedBox(height: 20),
                  // Added for spacing

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
                                borderRadius: BorderRadius.circular(10),
                                color: redColor),
                            height: 40,
                            width: 90.w,
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
          ),
        ),
      ),
    );
  }

  // Dummy timer list for demonstration
  List<String> timerList = ['15', '30', '45', '60', '120', '300'];
}
