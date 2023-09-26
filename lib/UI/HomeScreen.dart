import 'package:dogandcatprenktranlsator/Resources/StringResources.dart';
import 'package:dogandcatprenktranlsator/Resources/colorResources.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Resources/ImagesResources.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(homeScreenBackGroundImg), fit: BoxFit.fill)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 20.h,
                width: double.infinity,
                decoration: const BoxDecoration(color: redColor),
                child: Row(
                  children: [
                    Image.asset(homeSoundImg),
                    Column(
                      children: [
                        Text(soundText),
                        Text(
                          soundSubText,
                          textAlign: TextAlign.justify,
                        ),
                        Image.asset(homeSoundImg),
                      ],
                    )
                  ],
                ),
              ),
            ),
            // SizedBox(height: 3.h,),
            // Row(
            //   children: [
            //     Container(
            //       height: 30.h,
            //       width: 46.w,
            //       decoration: const BoxDecoration(
            //           image: DecorationImage(
            //               image: AssetImage(homeScreenTranslateImg),
            //               fit: BoxFit.fill)),
            //     ),
            //     SizedBox(width: 5.w,
            //     ),
            //     Container(
            //       height: 30.h,
            //       width: 46.w,
            //       decoration: const BoxDecoration(
            //           image: DecorationImage(
            //               image: AssetImage(homeScreenTranslateImg),
            //               fit: BoxFit.fill)),
            //       child: Text(
            //         "hyyyyy"
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    ));
  }
}
