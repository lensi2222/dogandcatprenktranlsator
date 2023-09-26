import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Resources/ImagesResources.dart';
import '../Resources/StringResources.dart';

class SplashFiveScreen extends StatefulWidget {
  const SplashFiveScreen({Key? key}) : super(key: key);

  @override
  State<SplashFiveScreen> createState() => _SplashFiveScreenState();
}

class _SplashFiveScreenState extends State<SplashFiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 83.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(splashScreenFiveImg),
                  // Assuming splashScreenOne is the correct image path
                  fit: BoxFit.fill,
                ),
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(splashScreenFiveTitle,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.sp),),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
                    child: Text(splashScreenFiveSubTitle,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10.sp)),
                  ),
                  SizedBox(height: 3.h,)
                ],
              ) ,
            ),

          ],
        ),
      ),

    );
  }
}
