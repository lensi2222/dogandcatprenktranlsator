import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Resources/ColorResources.dart';
import 'LanguageScreen.dart';

class TrainingDetailScreen extends StatefulWidget {
  String? title;
  String? subTitle;
  String? image;
   TrainingDetailScreen({Key? key, this.subTitle, this.title, this.image}) : super(key: key);

  @override
  State<TrainingDetailScreen> createState() => _TrainingDetailScreenState();
}

class _TrainingDetailScreenState extends State<TrainingDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          '${widget.title}',
          style: TextStyle(
            fontSize: 13.sp,
            color: blackColor,
          ),
        ),
      ),
      body: Column(children: [

        Container(
          height: 20.h,
          width: 50.w,
          child: Image.asset(
              '${widget.image}'
          ),
        ),
        Text('${widget.subTitle}'),
      ]),
    );
  }
}
