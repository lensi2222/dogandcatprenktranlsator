import 'package:dogandcatprenktranlsator/Resources/StringResources.dart';
import 'package:dogandcatprenktranlsator/UI/CategoryPage.dart';
import 'package:dogandcatprenktranlsator/UI/FakeCallScreen.dart';
import 'package:dogandcatprenktranlsator/UI/LanguageScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../Resources/ImagesResources.dart';
import '../Resources/colorResources.dart';
import 'TrainingScreen.dart';
import 'TranslatorScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  @override
  Widget build(BuildContext context) {
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
              builder: (context) => const LanguageScreen(),
            ),
          );
          return Future.value(false);
        },
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(homeScreenBackGroundImg),
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
                                _key.currentState!.openDrawer();
                                // Navigator.pushReplacement(context,
                                //     MaterialPageRoute(
                                //       builder: (context) {
                                //         return const TranslatorScreen();
                                //       },
                                //     ));
                              },
                              child: Image.asset(
                                drawerFakeCallImg,
                                height: 8.h,
                                width: 8.w,
                              )),
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: blackColor),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return CategoryPageScreen();
                        },
                      ));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            homeSoundImg,
                            height: 150,
                            width: 150,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Sound",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  soundSubText,
                                  textAlign: TextAlign.justify,
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            nextIconBackgroundImg,
                            height: 50,
                            width: 50,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 25.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const TranslatorScreen();
                                },
                              ));
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(homeTranslatorImg),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Translator",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Taylor Swift, Brendon Urie",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return TrainingScreen();
                                },
                              ));
                            },
                            child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(homeTrainingImg),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Training",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Taylor Swift, Brendon Urie",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        // Expanded(child: Image.asset(homeTrainingImg)),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const FakeCallScreen();
                        },
                      ));
                    },
                    child: Container(
                      height: 10.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(fakeCallTempImg),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: const Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              fakeCallText,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Bazzi, Camila Cabello",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 10.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(whistleImg),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: const Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Whistle",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "HRVY",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
