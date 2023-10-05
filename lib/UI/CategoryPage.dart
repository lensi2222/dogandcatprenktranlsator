import 'package:dogandcatprenktranlsator/UI/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../Resources/ColorResources.dart';
import '../Resources/ImagesResources.dart';
import '../Resources/StringResources.dart';
import 'CatScreen.dart';
import 'DogScreen.dart';

class CategoryPageScreen extends StatefulWidget {
  const CategoryPageScreen({Key? key}) : super(key: key);

  @override
  State<CategoryPageScreen> createState() => _CategoryPageScreenState();
}

class _CategoryPageScreenState extends State<CategoryPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(categoryBackgroundImg), fit: BoxFit.fill)),
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
                              return const HomeScreen();
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
                      "Categories",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: blackColor),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DogScreen();
                    },
                  ));
                },
                child: Container(
                  height: 10.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(homeDetailDogImg),
                        fit: BoxFit.fitWidth),
                  ),
                  child: const Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          dogText,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return CatScreen();
                    },
                  ));
                },
                child: Container(
                  height: 10.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(homeDetailCatImg),
                        fit: BoxFit.fitWidth),
                  ),
                  child: const Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          catText,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
