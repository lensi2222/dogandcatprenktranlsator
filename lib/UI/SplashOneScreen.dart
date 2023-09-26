import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Resources/ImagesResources.dart';
import '../Resources/StringResources.dart';

class SplashOneScreen extends StatefulWidget {
  const SplashOneScreen({Key? key}) : super(key: key);

  @override
  State<SplashOneScreen> createState() => _SplashOneScreenState();
}

class _SplashOneScreenState extends State<SplashOneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 70.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(splashScreenOneImg),
                  // Assuming splashScreenOne is the correct image path
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              children: [
                Text(splashScreenOneTitle,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.sp),),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
                  child: Text(splashScreenOneSubTitle,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10.sp)),
                ),
              ],
            )
          ],
        ),
      ),

    );
  }
}
