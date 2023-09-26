import 'package:dogandcatprenktranlsator/Resources/StringResources.dart';
import 'package:dogandcatprenktranlsator/UI/CatDetailsScreeen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Resources/ColorResources.dart';
import '../Resources/ListResources.dart';
import 'LanguageScreen.dart';

class CatScreen extends StatefulWidget {
  const CatScreen({Key? key}) : super(key: key);

  @override
  State<CatScreen> createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
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

      appBar: AppBar(centerTitle: true,

        title: Text(
          catTranslatorText,
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
        itemCount: catList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
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
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      catList[index].images!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      catList[index].title!,
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
