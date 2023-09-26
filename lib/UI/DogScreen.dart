import 'package:dogandcatprenktranlsator/Resources/ListResources.dart';
import 'package:dogandcatprenktranlsator/Resources/StringResources.dart';
import 'package:dogandcatprenktranlsator/UI/DogDetailsScreen.dart';
import 'package:dogandcatprenktranlsator/UI/LanguageScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Resources/ColorResources.dart';

class DogScreen extends StatefulWidget {
  const DogScreen({Key? key}) : super(key: key);

  @override
  State<DogScreen> createState() => _DogScreenState();
}

class _DogScreenState extends State<DogScreen> {
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
        title: Text(
          dogTranslatorText,
          style: TextStyle(
            fontSize: 13.sp,
            color: blackColor,
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 25,
        ),
        itemCount: dogDetailList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return DogDetailScreen(
                    audio: dogDetailList[index].audio,
                    title: dogDetailList[index].title,
                    image: dogDetailList[index].images,
                  );
                },
              ));
            },
            child: Card(
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      dogDetailList[index].images!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      dogDetailList[index].title!,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: blackColor,
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
    );

  }
}
