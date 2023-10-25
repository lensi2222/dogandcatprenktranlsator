import 'package:dogandcatprenktranlsator/Resources/StringResources.dart';
import 'package:dogandcatprenktranlsator/UI/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../Resources/ColorResources.dart';
import '../Resources/ImagesResources.dart';
import '../Resources/ListResources.dart';
import 'TrainingDetailScreen.dart';

class TrainingScreen extends StatefulWidget {
  TrainingScreen({Key? key}) : super(key: key);

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  int isSelected = 1;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(drawerBackGroundImg),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                CircleAvatar(
                  radius: 48, // Image radius
                  backgroundImage: AssetImage(dogCatDrawerImg),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Dog & Cat",
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "Translator Prank App",
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25))),
                    height: 6.h,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            languageDrawerIconImg,
                            height: 5.h,
                            width: 10.w,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Center(
                            child: Text(
                              "Language",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25))),
                    height: 6.h,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            shareDrawerIconImg,
                            height: 5.h,
                            width: 10.w,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Center(
                            child: Text(
                              "Share",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25))),
                    height: 6.h,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            privacyDrawerIconImg,
                            height: 5.h,
                            width: 10.w,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Center(
                            child: Text(
                              "Privacy",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25))),
                    height: 6.h,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            rateDrawerIconImg,
                            height: 5.h,
                            width: 10.w,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Center(
                            child: Text(
                              "Rate",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                              ),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
      body: WillPopScope(
        onWillPop: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
          return Future.value(false);
        },
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(TrainingBakeGroundImg),
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
                              _key.currentState!.openDrawer();
                            },
                            child: Image.asset(
                              drawerFakeCallImg,
                              height: 8.h,
                              width: 8.w,
                            )),
                      ),
                      Text(
                        trainingText,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color: blackColor),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isSelected = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color:
                                    isSelected == 1 ? redColor : Colors.black,
                              ),
                              color: isSelected == 1 ? redColor : Colors.white,
                            ),
                            height: 6.h,
                            child: Center(
                              child: Text(
                                dogText,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: isSelected == 1
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 11.sp),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isSelected = 2;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color:
                                    isSelected == 2 ? redColor : Colors.black,
                              ),
                              color: isSelected == 2 ? redColor : Colors.white,
                            ),
                            height: 6.h,
                            child: Center(
                              child: Text(
                                catText,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: isSelected == 2
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 10.sp),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (isSelected == 1)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: GridView.builder(
                          itemCount: trainingDogList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  childAspectRatio: 2 / 3),
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return TrainingDetailScreen(
                                      subTitleDetail:
                                          trainingDogList[index].detailSubTite,
                                      subTitle: trainingDogList[index].subTitle,
                                      title: trainingDogList[index].title,
                                      image: trainingDogList[index].images,
                                    );
                                  },
                                ));
                              },
                              child: GridTile(
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade300,
                                            spreadRadius: 2,
                                            blurRadius: 1)
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Image.asset(
                                            trainingDogList[index].images!),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          title: Text(
                                            "${trainingDogList[index].title}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 12),
                                          ),
                                          subtitle: Text(
                                            "${trainingDogList[index].subTitle}",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 30,
                                        width: 100,
                                        decoration: const BoxDecoration(
                                            color: redColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(25),
                                              bottomRight: Radius.circular(25),
                                            )),
                                        child: const Center(
                                          child: Text(
                                            'Read More...',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 10,
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  )
                else
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: GridView.builder(
                          itemCount: trainingCatList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  childAspectRatio: 2 / 3),
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return TrainingDetailScreen(
                                      subTitleDetail:
                                          trainingCatList[index].detailSubTite,
                                      subTitle: trainingCatList[index].subTitle,
                                      title: trainingCatList[index].title,
                                      image: trainingCatList[index].images,
                                    );
                                  },
                                ));
                              },
                              child: GridTile(
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade300,
                                            spreadRadius: 2,
                                            blurRadius: 1)
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Image.asset(
                                            trainingCatList[index].images!),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          title: Text(
                                            "${trainingCatList[index].title}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 12),
                                          ),
                                          subtitle: Text(
                                            "${trainingCatList[index].subTitle}",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 30,
                                        width: 100,
                                        decoration: const BoxDecoration(
                                            color: redColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(25),
                                              bottomRight: Radius.circular(25),
                                            )),
                                        child: const Center(
                                          child: Text(
                                            'Read More...',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 10,
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  )
                // Expanded(
                //   child: ListView.separated(
                //     separatorBuilder: (context, index) {
                //       return Padding(
                //         padding: EdgeInsets.symmetric(horizontal: 5.w),
                //         child: Divider(),
                //       );
                //     },
                //     // physics: NeverScrollableScrollPhysics(),
                //     shrinkWrap: true,
                //     itemCount: trainingCatList.length,
                //     itemBuilder: (BuildContext context, int index) {
                //       return Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Card(
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(15.0),
                //           ),
                //           color: Colors.white,
                //           elevation: 10,
                //           child: Column(
                //             mainAxisSize: MainAxisSize.min,
                //             children: <Widget>[
                //               ListTile(
                //                 leading: Image.asset(
                //                   trainingCatList[index].images!,
                //                   width: 15.w, // Adjust the width as needed
                //                   height: 15.h, // Adjust the height as needed
                //                 ),
                //                 title: Text(
                //                   trainingCatList[index].title!,
                //                   style: TextStyle(
                //                     fontSize: 15.sp,
                //                     color: blackColor,
                //                   ),
                //                 ),
                //                 subtitle: Text(
                //                   trainingCatList[index].subTitle!,
                //                   style: TextStyle(
                //                     fontSize: 13.sp,
                //                     color: blackColor,
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
