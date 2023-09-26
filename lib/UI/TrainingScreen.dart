
import 'package:dogandcatprenktranlsator/Resources/StringResources.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Resources/ColorResources.dart';
import '../Resources/ListResources.dart';
import 'LanguageScreen.dart';
import 'TrainingDetailScreen.dart';

class TrainingScreen extends StatefulWidget {

   TrainingScreen({Key? key}) : super(key: key);

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  int isSelected = 1;

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
          trainingText,
          style: TextStyle(
            fontSize: 13.sp,
            color: blackColor,
          ),
        ),
      ),
      body: Column(
        children: [
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
                          color: isSelected == 1 ? yellowColor : Colors.black,
                        ),
                        color: isSelected == 1 ? yellowColor : Colors.white,
                      ),
                      height: 6.h,
                      child: Center(
                        child: Text(
                          dogText,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color:
                                  isSelected == 1 ? Colors.white : Colors.black,
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
                          color: isSelected == 2 ? yellowColor : Colors.black,
                        ),
                        color: isSelected == 2 ? yellowColor : Colors.white,
                      ),
                      height: 6.h,
                      child: Center(
                        child: Text(
                          catText,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color:
                                  isSelected == 2 ? Colors.white : Colors.black,
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
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    // child: const Divider(),
                  );
                },
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: trainingDogList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return TrainingDetailScreen(
                              subTitle: trainingDogList[index].subTitle,
                              title: trainingDogList[index].title,
                              image: trainingDogList[index].images,
                            );
                          },
                        ));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.white,
                        elevation: 10,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Image.asset(
                                trainingDogList[index].images!,
                                width: 15.w, // Adjust the width as needed
                                height: 15.h, // Adjust the height as needed
                              ),
                              title: Text(
                                trainingDogList[index].title!,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: blackColor,
                                ),
                              ),
                              subtitle: Text(
                                trainingDogList[index].subTitle!,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          else
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Divider(),
                  );
                },
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: trainingCatList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Image.asset(
                              trainingCatList[index].images!,
                              width: 15.w, // Adjust the width as needed
                              height: 15.h, // Adjust the height as needed
                            ),
                            title: Text(
                              trainingCatList[index].title!,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: blackColor,
                              ),
                            ),
                            subtitle: Text(
                              trainingCatList[index].subTitle!,
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: blackColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
        ],
      ),
    );
  }
}
