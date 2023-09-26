import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';
import 'package:sizer/sizer.dart';
import '../CustomWidget/CountDownCustomClass.dart';
import '../Resources/ListResources.dart';
import '../Resources/colorResources.dart';
import 'ButtomNavigation.dart';
import 'LanguageScreen.dart';

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
        Icons.play_arrow_sharp;
      }
      print('Switch Button is ON');
    } else {
      if (audioIcon == false) {
        Icons.play_arrow_sharp;
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
            builder: (context) => const BottomNavigationScreen(),
          ),
        );
        return Future.value(false);
      },
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.

            children: <Widget>[
              SizedBox(height: 5.h,),
              ListTile(
                leading: Icon(Icons.language), title: Text("Language"),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return LanguageScreen(

                      );
                    },
                  ));
                },
              ),
              ListTile(
                leading: Icon(Icons.share), title: Text("Share"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),

        appBar: AppBar(
          centerTitle: true,
          // leading: IconButton(
          //   icon: const Icon(Icons.menu),
          //   onPressed: () {},
          // ),
          title: Text(
            '${widget.title}',
            style: TextStyle(
              fontSize: 13.sp,
              color: blackColor,
            ),
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Row(
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
                                              duration: Duration(
                                                  seconds: levelClock),
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
                                              }else{
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
                        child: Text("Timer"),
                      ),
                    ],
                  ),
                ),
                Switch(
                  onChanged: toggleSwitch,
                  value: isSwitched,
                  activeColor: Colors.blue,
                  activeTrackColor: greyColor.withOpacity(0.1),
                  inactiveThumbColor: greyColor,
                  inactiveTrackColor: greyColor.withOpacity(0.1),
                )
              ],
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
                  child: Container(height: 5.h, child: Icon(Icons.close)),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 20.h,
                  width: 50.w,
                  child: Image.asset('${widget.image}'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                    child: Icon(
                        audioIcon != false ? Icons.play_arrow_sharp : Icons.pause),
                  ),
                ),
              ],
            ),
            Slider(
              value: currentvol,
              onChanged: (newvol) {
                currentvol = newvol;
                PerfectVolumeControl.setVolume(newvol);
                setState(() {});
              },
              min: 0,
              max: 1,
              divisions: 100,
            )
          ],
        ),
      ),
    );
  }
}
