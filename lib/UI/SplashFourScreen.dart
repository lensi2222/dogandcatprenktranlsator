import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Resources/ImagesResources.dart';
import '../Resources/StringResources.dart';

class SplashFourScreen extends StatefulWidget {
  const SplashFourScreen({Key? key}) : super(key: key);

  @override
  State<SplashFourScreen> createState() => _SplashFourScreenState();
}

class _SplashFourScreenState extends State<SplashFourScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 83.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(splashScreenFourImg),
                  // Assuming splashScreenOne is the correct image path
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    splashScreenFoursTitle,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    child: Text(splashScreenFoursSubTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 10.sp)),
                  ),
                  SizedBox(
                    height: 3.h,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
