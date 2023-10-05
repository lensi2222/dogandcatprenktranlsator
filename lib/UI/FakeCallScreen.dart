import 'package:dogandcatprenktranlsator/Resources/StringResources.dart';
import 'package:dogandcatprenktranlsator/UI/HomeScreen.dart';
import 'package:dogandcatprenktranlsator/UI/TakeVideoCallScreen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../Resources/ColorResources.dart';
import '../Resources/ImagesResources.dart';
import '../Resources/ListResources.dart';
import 'CategoryPage.dart';

class FakeCallScreen extends StatefulWidget {
  const FakeCallScreen({Key? key}) : super(key: key);

  @override
  State<FakeCallScreen> createState() => _FakeCallScreenState();
}

class _FakeCallScreenState extends State<FakeCallScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
        return Future.value(false);
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(fakeCallBackGroundImg),
                    fit: BoxFit.fill)),
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
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return const CategoryPageScreen();
                                },
                              ));
                            },
                            child: Image.asset(
                              drawerFakeCallImg,
                              height: 8.h,
                              width: 8.w,
                            )),
                      ),
                      Text(
                        fakeCallText,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color: blackColor),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  // separatorBuilder: (context, index) {
                  //   return Padding(
                  //     padding: EdgeInsets.symmetric(horizontal: 5.w),
                  //     child: Divider(),
                  //   );
                  // },
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: fakeCallList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
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
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(20),
                                  alignment: Alignment.center,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade300,
                                            spreadRadius: 2,
                                            blurRadius: 15)
                                      ],
                                      borderRadius: BorderRadius.circular(10)),
                                  // child: Padding(
                                  //   padding: EdgeInsets.only(right: 0.w),
                                  //   child: const Center(
                                  //     child: Row(
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.end,
                                  //       children: [
                                  //         Icon(
                                  //           Icons.arrow_forward_ios_rounded,
                                  //           size: 25,
                                  //           color: blackColor,
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                ),
                                Positioned(
                                    top: -25,
                                    bottom: 0,
                                    left: 8.w,
                                    right: 8.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          fakeCallList[index].images!,
                                          height: 100,
                                          width: 18.w,
                                          fit: BoxFit.fill,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: Text(
                                            fakeCallList[index].title!,
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                color: blackColor,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 20),
                                          child: Image.asset(
                                            nextIconBackgroundImg,
                                            height: 40,
                                            width: 40,
                                            fit: BoxFit.fill,
                                            // size: 20,
                                            // color: blackColor,
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            )),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
