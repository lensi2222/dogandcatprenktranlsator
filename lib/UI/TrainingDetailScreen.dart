import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../Resources/ColorResources.dart';
import '../Resources/ImagesResources.dart';
import 'TrainingScreen.dart';

class TrainingDetailScreen extends StatefulWidget {
  String? title;
  String? subTitle;
  String? image;
  String? subTitleDetail;

  TrainingDetailScreen({Key? key, this.subTitle, this.title, this.image,this.subTitleDetail})
      : super(key: key);

  @override
  State<TrainingDetailScreen> createState() => _TrainingDetailScreenState();
}

class _TrainingDetailScreenState extends State<TrainingDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     '${widget.title}',
      //     style: TextStyle(
      //       fontSize: 13.sp,
      //       color: blackColor,
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(trainingDetailBackgroundImg),
                    fit: BoxFit.fill)),
            child: Column(children: [
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
                                    return  TrainingScreen();
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
                      '${widget.title}',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: blackColor),
                    ),
                  ],
                ),
              ),
              Container(
                height: 30.h,
                width: 80.w,
                child: Image.asset('${widget.image}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${widget.subTitleDetail}'),
              ),

            ]),
          ),
        ),
      ),
    );
  }
}
