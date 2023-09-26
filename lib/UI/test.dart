import 'package:dogandcatprenktranlsator/Resources/ImagesResources.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.add_a_photo)),
      title: Text("testApp"),
    ),
      body: Column(
        children: [
          Image.asset(goldenImg,height: 40,width: 40,)
        ],
      ),
    );
  }
}
