import 'package:dogandcatprenktranlsator/Resources/ListResources.dart';
import 'package:dogandcatprenktranlsator/Resources/StringResources.dart';
import 'package:dogandcatprenktranlsator/UI/DogDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../Resources/ColorResources.dart';
import '../Resources/ImagesResources.dart';
import 'CategoryPage.dart';

class DogScreen extends StatefulWidget {
  const DogScreen({Key? key}) : super(key: key);

  @override
  State<DogScreen> createState() => _DogScreenState();
}

class _DogScreenState extends State<DogScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return const CategoryPageScreen();
          },
        ));
        return Future.value(false);
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(dogBackgroundImg),
                fit: BoxFit.fill,
              ),
            ),
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
                            Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) {
                                return const CategoryPageScreen();
                              },
                            ));
                          },
                          child: Container(

                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: litePinkColor,
                                shape: BoxShape.circle // Set the background color
                            ),
                            child: Center(
                              child:
                              Icon(Icons.arrow_back_ios, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        dogText,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color: blackColor),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 25.0,
                    ),
                    itemCount: dogDetailList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DogDetailScreen(
                                  audio: dogDetailList[index].audio,
                                  title: dogDetailList[index].title,
                                  image: dogDetailList[index].images,
                                );
                              },
                            ),
                          );
                        },
                        child: Card(
                          color: redColor,
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  width: double.infinity,
                                  dogDetailList[index].images!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  dogDetailList[index].title!,
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: whiteColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
