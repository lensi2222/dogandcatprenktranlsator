import 'package:dogandcatprenktranlsator/Resources/StringResources.dart';
import 'package:dogandcatprenktranlsator/UI/CatDetailsScreeen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../Resources/ColorResources.dart';
import '../Resources/ImagesResources.dart';
import '../Resources/ListResources.dart';
import 'CategoryPage.dart';

class CatScreen extends StatefulWidget {
  const CatScreen({Key? key}) : super(key: key);

  @override
  State<CatScreen> createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
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
                image: AssetImage(catBackgroundImg),
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
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
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
                                shape:
                                    BoxShape.circle // Set the background color
                                ),
                            child: Center(
                              child: Icon(Icons.arrow_back_ios,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        catText,
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 25,
                    ),
                    itemCount: catList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return CatDetailScreen(
                                audio: catList[index].audio,
                                title: catList[index].title,
                                image: catList[index].images,
                              );
                            },
                          ));
                        },
                        child: Card(
                          color: redColor,
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  width: double.infinity,
                                  catList[index].images!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  catList[index].title!,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 10.sp,
                                      color: whiteColor,
                                      fontWeight: FontWeight.w600),
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
