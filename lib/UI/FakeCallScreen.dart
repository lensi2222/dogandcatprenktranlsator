import 'package:dogandcatprenktranlsator/Resources/StringResources.dart';
import 'package:dogandcatprenktranlsator/UI/TakeVideoCallScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../Resources/ColorResources.dart';
import '../Resources/ListResources.dart';
import 'LanguageScreen.dart';

class FakeCallScreen extends StatefulWidget {
  const FakeCallScreen({Key? key}) : super(key: key);

  @override
  State<FakeCallScreen> createState() => _FakeCallScreenState();
}

class _FakeCallScreenState extends State<FakeCallScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.

          children: <Widget>[
            SizedBox(height: 5.h,),
            ListTile(
              leading: Icon(Icons.language), title: Text("Language"),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return LanguageScreen(

                    );
                  },
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.share), title: Text("Share"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      appBar: AppBar(
        centerTitle: true,
        // leading: IconButton(
        //   icon: const Icon(Icons.menu),
        //   onPressed: () {},
        // ),
        title: Text(
          fakeCallText,
          style: TextStyle(
            fontSize: 13.sp,
            color: blackColor,
          ),
        ),
      ),
      body: Column(
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
            itemCount: fakeCallList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return TakeVideoCallScreen(
                              title: fakeCallList[index].title,
                              image: fakeCallList[index].images,
                              video: fakeCallList[index].video,
                            );
                          },
                        ));
                      },
                      child: Container(
                        child: Center(
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(70.0),
                                child: Image.asset(
                                  fakeCallList[index].images!,
                                  height: 5.h,
                                  width: 11.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                fakeCallList[index].title!,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: blackColor,
                                ),
                              ),
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
        ],
      ),
    );
  }
}
