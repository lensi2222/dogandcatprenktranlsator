import 'package:dogandcatprenktranlsator/Resources/ImagesResources.dart';
import 'package:dogandcatprenktranlsator/Resources/StringResources.dart';
import 'package:dogandcatprenktranlsator/UI/CatScreen.dart';
import 'package:dogandcatprenktranlsator/UI/DogScreen.dart';
import 'package:dogandcatprenktranlsator/UI/FakeCallScreen.dart';
import 'package:dogandcatprenktranlsator/UI/TrainingScreen.dart';
import 'package:dogandcatprenktranlsator/UI/TranslatorScreen.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int pageIndex = 0;

  final pages = [
    DogScreen(),
    CatScreen(),
    TranslatorScreen(),
    TrainingScreen(),
    FakeCallScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: (value) {
            setState(() {
              pageIndex = value;
            });
          },
          selectedItemColor: Colors.blue,
          selectedFontSize: 12,
          type: BottomNavigationBarType.fixed,

          items: [

            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(dogImg),size: 30,
                  color: pageIndex == 0 ? Colors.blue : Colors.black,
                ),
                label: dogText),
            BottomNavigationBarItem(
                icon:  ImageIcon(
                  AssetImage(catImg),size: 30,
                  color: pageIndex == 1? Colors.blue : Colors.black,
                ),
                label: catText),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(translatorImg),size: 30,
                  color: pageIndex == 2? Colors.blue : Colors.black,
                ),
                label: translatorText),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(trainingImg),size: 30,
                  color: pageIndex == 3? Colors.blue : Colors.black,
                ),
                label: trainingText),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(fakeCallImg),size: 30,
                  color: pageIndex == 4? Colors.blue : Colors.black,
                ),
                label: fakeCallText)
          ]),
      body: pages[pageIndex]
    );
  }
}
