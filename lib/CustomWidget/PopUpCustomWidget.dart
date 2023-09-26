import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Resources/ColorResources.dart';
import '../Resources/StringResources.dart';

class ShowDialog extends StatelessWidget {

  Function()? onTapWatchAd;

  ShowDialog({Key? key,this.onTapWatchAd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return StatefulBuilder(builder: (context, setState) {
      return Dialog(
        backgroundColor: whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(youCanWatchAdsToUnlockThisText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.sp, color: blackColor)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: yellowColor,
                            borderRadius: BorderRadius.circular(10)),
                        height: 5.h,
                        width: 25.w,
                        child: Center(
                            child: Text("Close",
                                style: TextStyle(
                                    fontSize: 11.sp, color: blackColor))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: onTapWatchAd,
                      child: Container(
                        height: 5.h,
                        width: 25.w,
                        decoration: BoxDecoration(
                            color: yellowColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                              "WatchAds",
                              style: TextStyle(
                                  fontSize: 11.sp, color: blackColor),
                            )),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    // },

    // );
  }
}
