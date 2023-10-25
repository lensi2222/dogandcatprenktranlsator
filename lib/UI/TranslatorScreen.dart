import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:dogandcatprenktranlsator/UI/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';
import '../CustomWidget/PopUpCustomWidget.dart';
import '../Resources/AudioResources.dart';
import '../Resources/ColorResources.dart';
import '../Resources/StringResources.dart';
import '../Resources/ImagesResources.dart';
import '../main.dart';
import 'TranslatorResultScreen.dart';

class TranslatorScreen extends StatefulWidget {
  const TranslatorScreen({Key? key}) : super(key: key);

  @override
  State<TranslatorScreen> createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen>
    with WidgetsBindingObserver {
  int selectedImageIndex = 0;
  int selectedImageIndex1 = 0;
  bool isTranslator = false;

  // bool isTranslatorTimer = false;
  Timer? _timer;
  int _secondsElapsed = 0;
  List<String> images = [humanToDogText, dogToHumanText];
  List<String> images2 = [dogToHumanText, humanToDogText];

  // void changeImage() {
  //   setState(() {
  //     // Toggle between the images
  //     selectedImageIndex = (selectedImageIndex + 1) % images.length;
  //     selectedImageIndex1 = (selectedImageIndex1 + 1) % images2.length;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    loadAd();
    WidgetsBinding.instance.addObserver(this);
    // startTimer();
  }

  void startTimer() {
    isTranslatorTimer = 1;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _secondsElapsed++;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int minutes = _secondsElapsed ~/ 60;
    int seconds = _secondsElapsed % 60;
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    return Scaffold(
      key: _key,
      drawer: Drawer(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(drawerBackGroundImg),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                CircleAvatar(
                  radius: 48, // Image radius
                  backgroundImage: AssetImage(dogCatDrawerImg),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Dog & Cat",
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "Translator Prank App",
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25))),
                    height: 6.h,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            languageDrawerIconImg,
                            height: 5.h,
                            width: 10.w,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Center(
                            child: Text(
                              "Language",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25))),
                    height: 6.h,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            shareDrawerIconImg,
                            height: 5.h,
                            width: 10.w,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Center(
                            child: Text(
                              "Share",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25))),
                    height: 6.h,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            privacyDrawerIconImg,
                            height: 5.h,
                            width: 10.w,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Center(
                            child: Text(
                              "Privacy",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25))),
                    height: 6.h,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            rateDrawerIconImg,
                            height: 5.h,
                            width: 10.w,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Center(
                            child: Text(
                              "Rate",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                              ),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
      body: WillPopScope(
        onWillPop: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
          return Future.value(false);
        },
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(translatorBackgroundImg),
                    fit: BoxFit.fill)),
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
                              _key.currentState!.openDrawer();
                            },
                            child: Image.asset(
                              drawerFakeCallImg,
                              height: 8.h,
                              width: 8.w,
                            )),
                      ),
                      Text(
                        'Translator Screen',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color: blackColor),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5.w, left: 5.w),
                  child: Container(
                    height: 10.h,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Dog to Human",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12.sp)),

                        // Image.asset(images2[selectedImageIndex1],
                        //     height: 7.h, width: 20.w),

                        GestureDetector(
                          // onTap: changeImage,
                          child: Image.asset(translatorIconImg,
                              height: 10.h, width: 20.w),
                        ),
                        Text("Human to Dog",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12.sp)),
                        // Image.asset(images[selectedImageIndex],
                        //     height: 7.h, width: 20.w),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Your existing content goes here
                      Container(
                        height: 40.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: greyColor,
                              blurRadius: 2.0,
                            )
                          ],
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 90,
                            ),
                            Image.asset(
                              isTranslator == false
                                  ? miceTranslatorImg
                                  : miceTransloterWaveImg,
                              height: 8.h,
                            ),
                            Container(
                              height: 10,
                            ),
                            Text(
                              pressToRecordText,
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Text(
                              isTranslator == false
                                  ? '00:00'
                                  : '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                              style: TextStyle(
                                fontSize: 30.sp,
                                color: redColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: GestureDetector(
                                onTap: () {
                                  if (isTranslator == false) {
                                    _showDialog(context);
                                  } else if (isTranslator == true) {
                                    if (isTranslatorTimer == 0) {
                                      print('timer start');
                                      startTimer();
                                    } else {
                                      print('timer cancel');
                                      _timer!.cancel();
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return TranslatorResultScreen();
                                        },
                                      ));
                                    }
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: redColor),
                                  height: 40,
                                  width: 80.w,
                                  child: Center(
                                    child: Text(
                                      "Translator",
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
                      // Add the image as positioned in the stack
                      Positioned(
                        top: -70,
                        left: 115,
                        child: Container(
                          height: 150,
                          width: 150,
                          child: Image.asset(dogHumanTranslatorImg),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int isTranslatorTimer = 0;

  // TODO: replace this test ad unit with your own ad unit.
  final adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/5354046379'
      : 'ca-app-pub-3940256099942544/6978759866';

  /// Loads a rewarded ad.
  void loadAd() {
    RewardedInterstitialAd.load(
        adUnitId: adUnitId,
        request: const AdRequest(),
        rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
            setState(() {
              rewardeInterstitialdAd = ad;
            });
            ad.fullScreenContentCallback = FullScreenContentCallback(
                onAdShowedFullScreenContent: (ad) {},
                onAdImpression: (ad) {},
                onAdFailedToShowFullScreenContent: (ad, err) {
                  ad.dispose();
                },
                onAdDismissedFullScreenContent: (ad) {
                  isTranslator = true;
                  print('hhhhhhhhhh');

                  ad.dispose();
                },
                onAdClicked: (ad) {});
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('RewardedInterstitialAd failed to load: $error');
          },
        ));
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ShowDialog(
          onTapWatchAd: () {
            setState(() {
              isTranslator = true;
              Navigator.pop(context);
              rewardeInterstitialdAd!.show(
                  onUserEarnedReward:
                      (AdWithoutView ad, RewardItem rewardItem) {});
            });
          },
        );
      },
    );
  }

  List dogCatImagesList = [happyCatImg, huskyImg];
  List dogCatAudioList = [cat01Audio, dogAgreeAudio];

  Image? randomLieImg;

  void generateRandomDogCatImg() {
    Random random = Random();
    int randomIndex = random.nextInt(dogCatImagesList.length);
    setState(() {
      randomLieImg = Image.asset(
        dogCatImagesList[randomIndex],
        width: double.infinity,
        fit: BoxFit.fill,
      ); // Reset the true image
    });
  }

// void _showRandomResultPopUp(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Popup Title'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text('This is a subtitle.'),
//             SizedBox(height: 10),
//             Image.asset(
//               goldenImg,
//               height: 10.h,
//               width: 30.w,
//             ),
//             // Replace with your image asset path
//           ],
//         ),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text('Close'),
//           ),
//         ],
//       );
//     },
//   );
// }
}
