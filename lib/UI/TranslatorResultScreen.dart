import 'dart:math';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:dogandcatprenktranlsator/Resources/ColorResources.dart';
import 'package:dogandcatprenktranlsator/Resources/ImagesResources.dart';
import 'package:dogandcatprenktranlsator/UI/TranslatorScreen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../Model/PetModel.dart';
import '../Resources/ListResources.dart';

class TranslatorResultScreen extends StatefulWidget {
  @override
  _TranslatorResultScreenState createState() => _TranslatorResultScreenState();
}

class _TranslatorResultScreenState extends State<TranslatorResultScreen> {
  List<PetModel> petList = [
    ...catList.map((cat) => PetModel(
          title: cat.title!,
          images: cat.images!,
          audio: cat.audio!,
        )),
    ...dogDetailList.map((dog) => PetModel(
          title: dog.title!,
          images: dog.images!,
          audio: dog.audio!,
        )),
  ];

  Random random = Random();
  int randomIndex = 0;

  void generateRandomCat() {
    setState(() {
      List<int> randomIndices = [];

      // Generate 6 unique random indices
      while (randomIndices.length < petList.length) {
        int randomIndex = random.nextInt(petList.length);
        if (!randomIndices.contains(randomIndex)) {
          randomIndices.add(randomIndex);
        }
      }
      randomIndex = randomIndices[0];
    });
  }

  final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  bool isSwitched = false;

  void loadAudio() {
    assetsAudioPlayer.open(
      Audio('${petList[randomIndex].audio!}'),
      // autoStart: isSwitched,
      loopMode: isSwitched ? LoopMode.single : LoopMode.none,
    );
  }

  @override
  void initState() {
    generateRandomCat(); // Generate the initial random cat
    loadAudio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PetModel randomPet = petList[randomIndex];

    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return TranslatorScreen();
          },
        ));
        return Future.value(false);
      },
      child: Scaffold(
        body: SafeArea(
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
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return const TranslatorScreen();
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
                        'Result Screen',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color: blackColor),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        randomPet.title,
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.w700),
                      ),
                      Image.asset(
                        randomPet.images,
                        width: 75.w,
                        height: 50.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return TranslatorScreen();
                            },
                          ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: redColor),
                          height: 40,
                          width: 60.w,
                          child: Center(
                            child: Text(
                              "Close",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14.sp,
                                color: whiteColor,
                              ),
                            ),
                          ),
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
}
