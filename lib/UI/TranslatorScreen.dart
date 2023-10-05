import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:dogandcatprenktranlsator/UI/LanguageScreen.dart';
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
  List<String> images = [girlImg, dogTransferImg];
  List<String> images2 = [dogTransferImg, girlImg];

  void changeImage() {
    setState(() {
      // Toggle between the images
      selectedImageIndex = (selectedImageIndex + 1) % images.length;
      selectedImageIndex1 = (selectedImageIndex1 + 1) % images2.length;
    });
  }

  @override
  void initState() {
    super.initState();
    loadAd();
    WidgetsBinding.instance.addObserver(this);
    // startTimer();
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.resumed) {
  //     startTimer();
  //   } else if (state == AppLifecycleState.paused) {
  //     _timer?.cancel();
  //   }
  // }

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

    return Scaffold(


      // appBar: AppBar(
      //   centerTitle: true,
      //
      //   title: Text(
      //     translatorText,
      //     style: TextStyle(
      //       fontSize: 13.sp,
      //       color: blackColor,
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(translatorBackgroundImg),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 2.0.h),
                child: Container(
                  height: 10.h,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(images2[selectedImageIndex1],
                          height: 7.h, width: 20.w),
                      GestureDetector(
                        onTap: changeImage,
                        child: Image.asset(tranferImg, height: 7.h, width: 20.w),
                      ),
                      Image.asset(images[selectedImageIndex],
                          height: 7.h, width: 20.w),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 2.0.h),
                child: Container(
                  height: 45.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: greyColor,
                        blurRadius: 2.0,
                      )
                    ],
                    color: yellowColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Image.asset(waveMusicImg,
                          height: 10.h,
                          width: 70.w,
                          color: whiteColor,
                          fit: BoxFit.fill),
                      Text(
                        isTranslator == false
                            ? '00:00'
                            : '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                        style: TextStyle(
                          fontSize: 30.sp,
                          color: whiteColor,
                        ),
                      ),
                      Container(height: 5.h),
                      GestureDetector(
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
                                  return TranslatorResultScreen(

                                  );
                                },
                              ));

                            }
                          }
                        },
                        child: Image.asset(voiceImg,
                            height: 10.h,
                            width: 20.w,
                            color: whiteColor,
                            fit: BoxFit.fill),
                      ),
                      Container(height: 5.h),
                      Text(
                        pressToRecordText,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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

  void _showRandomResultPopUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Popup Title'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('This is a subtitle.'),
              SizedBox(height: 10),
              Image.asset(
                goldenImg,
                height: 10.h,
                width: 30.w,
              ),
              // Replace with your image asset path
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
