import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../Resources/ImagesResources.dart';
import '../Resources/StringResources.dart';
import '../Resources/colorResources.dart';
import '../main.dart';
import 'PageIndicaterScreen.dart';
import 'SplashOneScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkConnection() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      Future.delayed(const Duration(seconds: 3)).then((value) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return const PageIndicatorScreen();
          },
        ));
      });
    } else if (connectivityResult == ConnectivityResult.wifi) {
      Future.delayed(const Duration(seconds: 3)).then((value) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return const PageIndicatorScreen();
          },
        ));
      });
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      Future.delayed(const Duration(seconds: 3)).then((value) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return const PageIndicatorScreen();
          },
        ));
      });
    } else if (connectivityResult == ConnectivityResult.vpn) {
      Future.delayed(const Duration(seconds: 3)).then((value) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return const PageIndicatorScreen();
          },
        ));
      });
    } else if (connectivityResult == ConnectivityResult.bluetooth) {
    } else if (connectivityResult == ConnectivityResult.other) {
    } else if (connectivityResult == ConnectivityResult.none) {
      noInternetDialog();
    }
  }

  noInternetDialog() {
    showDialog(
      context: MyApp.navigatorKey.currentContext!,
      builder: (context) {
        return Dialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.w)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(2.w),
                child: Lottie.asset(noInternetImg, height: 20.h, width: 50.w),
              ),
              Padding(
                padding: EdgeInsets.all(2.w),
                child: Text(
                  noInternetText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: Colors.black),
                ),
              ),
              InkWell(
                onTap: () {
                  exit(0);
                },
                child: Padding(
                  padding: EdgeInsets.all(2.w),
                  child: Container(
                    height: 5.h,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(15.w)),
                    child: Center(
                      child: Text(
                        closeText,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: blackColor,
                            fontSize: 10.sp),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    checkConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: Center(
              child: Image.asset(
                splashScreenImg,
                height: 40.h,
                width: 90.w,
              )),
        ),

      ]),
    );
  }
}
