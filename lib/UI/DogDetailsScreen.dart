import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:dogandcatprenktranlsator/UI/DogScreen.dart';
import 'package:flutter/material.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';
import 'package:sizer/sizer.dart';
import '../CustomWidget/CountDownCustomClass.dart';
import '../Resources/ImagesResources.dart';
import '../Resources/ListResources.dart';
import '../Resources/StringResources.dart';
import '../Resources/colorResources.dart';

class DogDetailScreen extends StatefulWidget {
  String? title;
  String? image;
  String? audio;
  int? timerListSelectedIndex;

  DogDetailScreen({
    Key? key,
    this.title,
    this.image,
    this.audio,
    this.timerListSelectedIndex,
  }) : super(key: key);

  @override
  State<DogDetailScreen> createState() => _DogDetailScreenState();
}

class _DogDetailScreenState extends State<DogDetailScreen>
    with TickerProviderStateMixin {
  String dropdownValue = 'OFF';
  bool isSwitched = false;
  bool audioIcon = true;
  bool audioPlayer = true;
  double currentvol = 0.5;
  int timerButtonTapCount = 0;
  int timerListSelectedIndex = 0;
  bool showTimer = false;
  AnimationController? _controller;

  final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  void toggleSwitch(bool value) {
    setState(() {
      isSwitched = value;
      if (isSwitched) {
        loopAudio();
      } else {
        assetsAudioPlayer.setLoopMode(LoopMode.none);
      }
    });

    if (isSwitched) {
      if (audioIcon == false) {
        Image.asset(playButtonImg);
        // Icons.play_arrow_sharp;
      }
      print('Switch Button is ON');
    } else {
      if (audioIcon == false) {
        Image.asset(playButtonImg);
        // Icons.play_arrow_sharp;
      }
      print('Switch Button is OFF');
    }
  }

  void loopAudio() {
    assetsAudioPlayer.setLoopMode(LoopMode.single);
  }

  void stopAudio() {
    setState(() {
      audioPlayer = false;
    });
    assetsAudioPlayer.pause();
  }

  void loadAudio() {
    assetsAudioPlayer.open(
      Audio('${widget.audio}'),
      loopMode: isSwitched ? LoopMode.single : LoopMode.none,
    );
  }

  @override
  void initState() {
    PerfectVolumeControl.hideUI = false;
    Future.delayed(Duration.zero, () async {
      currentvol = await PerfectVolumeControl.getVolume();
      setState(() {
        // Refresh UI
      });
    });

    PerfectVolumeControl.stream.listen((volume) {
      setState(() {
        currentvol = volume;
      });
    });

    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      // Increment counter
    });
  }

  int levelClock = 0;

  @override
  void dispose() {
    // Dispose of the controller properly
    if (_controller != null) {
      _controller!.stop();
      _controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DogScreen(),
          ),
        );
        return Future.value(false);
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(dogDetailBackgroundImg),
                fit: BoxFit.fill,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return const DogScreen();
                                },
                              ));
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: litePinkColor,
                                  shape: BoxShape
                                      .circle // Set the background color
                                  ),
                              child: Center(
                                child: Icon(Icons.arrow_back_ios,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          dogText,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: blackColor),
                        ),
                      ],
                    ),
                  ),
                  showTimer == true
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("The Sound Will Play in"),
                            SizedBox(
                              width: 5.w,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  showTimer = false;
                                });
                              },
                              child: Container(
                                  height: 5.h, child: Icon(Icons.close)),
                            )
                          ],
                        )
                      : SizedBox(),
                  showTimer == true
                      ? Countdown(
                          animation: StepTween(
                            begin: levelClock,
                            end: 0,
                          ).animate(_controller!),
                        )
                      : SizedBox(),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            '${widget.image}',
                            height: 30.h,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Text(
                        '${widget.title}',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          color: blackColor,
                        ),
                      ),
                      Container(
                        height: 20.h,
                        width: 50.w,
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                audioIcon = !audioIcon;

                                if (audioIcon == true) {
                                  stopAudio();
                                } else {
                                  loadAudio();
                                }
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: Image.asset(
                                audioIcon != false
                                    ? playButtonImg
                                    : pushButtonImg,
                              ),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          if (_controller != null) {
                            _controller!.stop();
                            _controller!.dispose();
                          }
                          _controller = null;
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                insetPadding:
                                    EdgeInsets.symmetric(horizontal: 15),
                                child: Container(
                                  height: 300,
                                  child: ListView.builder(
                                    itemCount: timerList.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          showTimer = true;
                                          setState(() {
                                            timerListSelectedIndex = index;
                                            print(
                                                "---> $timerListSelectedIndex");
                                            levelClock =
                                                int.parse(timerList[index]);
                                            print(
                                                "---> $timerListSelectedIndex");
                                            print("---> $levelClock");
                                            Navigator.pop(context);
                                            _controller = AnimationController(
                                              vsync: this,
                                              duration:
                                                  Duration(seconds: levelClock),
                                            );

                                            _controller!.forward();
                                            _controller!
                                                .addStatusListener((status) {
                                              if (status ==
                                                  AnimationStatus.completed) {
                                                loadAudio();
                                                setState(() {
                                                  showTimer = false;
                                                });
                                              } else {
                                                print('stutas -->$status');
                                              }
                                            });
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(10),
                                          height: 30,
                                          width: 60,
                                          color: Colors.white,
                                          child: Center(
                                              child: Text(timerList[index])),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Container(
                            width: 22.w,
                            height: 6.h,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(dogAndCatTimerImg),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Center(child: Text("Timer")),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: redColor)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.0),
                            child: Row(
                              children: [
                                Text("Loop"),
                                Switch(
                                  onChanged: toggleSwitch,
                                  value: isSwitched,
                                  activeColor: redColor,
                                  activeTrackColor: litePinkColor,
                                  inactiveThumbColor: redColor,
                                  inactiveTrackColor: litePinkColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(volumeMinusImg, height: 7.h, width: 7.w),
                        Container(
                          width: 70.w,
                          child: Slider(
                            activeColor: redColor,
                            value: currentvol,
                            onChanged: (newvol) {
                              currentvol = newvol;
                              PerfectVolumeControl.setVolume(newvol);
                              setState(() {});
                            },
                            min: 0,
                            max: 1,
                            divisions: 100,
                          ),
                        ),
                        Image.asset(volumePlushImg, height: 7.h, width: 7.w),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
