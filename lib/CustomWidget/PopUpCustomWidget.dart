import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Resources/ColorResources.dart';
import '../Resources/ImagesResources.dart';
import '../Resources/StringResources.dart';

class ShowDialog extends StatelessWidget {

  Function()? onTapWatchAd;

  ShowDialog({Key? key,this.onTapWatchAd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return StatefulBuilder(builder: (context, setState) {
      return Dialog(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(popUpBackGroundImg),
                  fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      children: [
                        Image.asset(hornImg,height: 4.h,),
                        Expanded(
                          child: Text(youCanWatchAdsToUnlockThisText,overflow: TextOverflow.visible,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14.sp, color: blackColor)),
                        ),
                      ],
                    ),
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
                              color: redColor,
                              borderRadius: BorderRadius.circular(10)),
                          height: 5.h,
                          width: 25.w,
                          child: Center(
                              child: Text("Close",
                                  style: TextStyle(
                                      fontSize: 11.sp, color: whiteColor))),
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
                              color: redColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text(
                                "WatchAds",
                                style: TextStyle(
                                    fontSize: 11.sp, color: whiteColor),
                              )),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    // },

    // );
  }
}
