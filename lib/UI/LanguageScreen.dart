import 'package:dogandcatprenktranlsator/Resources/ColorResources.dart';
import 'package:dogandcatprenktranlsator/Resources/StringResources.dart';
import 'package:dogandcatprenktranlsator/UI/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../Resources/ImagesResources.dart';
import '../Resources/ListResources.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int selectedLanguageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(language,style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            color: blackColor),),
      ),
      body:Column(
        children: [
          ListView.separated(
            separatorBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Divider(),
              );
            },
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: languageList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 5.w, vertical: 1.h),
                child: Column(
                  children: [
                    Container(
                      child: Center(
                        child: GestureDetector(
                          onTap:(){
                            setState(() {
                              selectedLanguageIndex = index;
                              print(selectedLanguageIndex);
                            });
                          },
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius:
                                BorderRadius.circular(50.0),
                                child: Image.asset(
                                  languageList[index].images!,
                                  height: 3.h,
                                  width: 7.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                languageList[index].title!,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: blackColor,
                                ),
                              ),
                              Spacer(),
                              selectedLanguageIndex == index
                                  ? Image.asset(color: redColor,
                                selectLanImg,
                                height: 3.h,
                                width: 7.w,
                              )
                                  : Icon(Icons.radio_button_off_outlined,color: redColor,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Divider(),
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return const HomeScreen();
                },
              ));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 5.w, vertical: 1.h),
              child: Container(
                width: double.infinity,
                height: 5.h,
                decoration: const BoxDecoration(
                    borderRadius:
                    BorderRadius.all(Radius.circular(30)),
                   color: redColor),
                child: Center(
                  child: Text(
                    startAppText,
                    style: TextStyle(fontWeight: FontWeight.w700,
                      fontSize: 13.sp,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ) ,
    );
  }
}
