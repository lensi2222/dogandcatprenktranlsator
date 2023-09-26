import 'package:dogandcatprenktranlsator/Resources/ImagesResources.dart';
import 'package:dogandcatprenktranlsator/UI/HomeScreen.dart';
import 'package:dogandcatprenktranlsator/UI/LanguageScreen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'SplashOneScreen.dart';
import 'SplashTwoScreen.dart';
import 'SplashThreeScreen.dart';
import 'SplashFourScreen.dart';
import 'SplashFiveScreen.dart';

class PageIndicatorScreen extends StatefulWidget {
  const PageIndicatorScreen({Key? key}) : super(key: key);

  @override
  State<PageIndicatorScreen> createState() => _PageIndicatorScreenState();
}

class _PageIndicatorScreenState extends State<PageIndicatorScreen> {
  final PageController _controller = PageController(initialPage: 0);
  late ValueNotifier<int> _currentPageNotifier;

  @override
  void initState() {
    super.initState();
    _currentPageNotifier = ValueNotifier<int>(0); // Initialize with 0
    _controller.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    _currentPageNotifier.value = _controller.page?.round() ?? 0;
  }

  @override
  void dispose() {
    _currentPageNotifier.dispose();
    _controller.removeListener(_onPageChanged);
    _controller.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_controller.page != 4) {
      _controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }
  void _onTapImage(int currentPage) {
    if (currentPage == 4) {
      // Navigate to the home screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LanguageScreen()),
      );
    } else {
      _controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              children: const [
                SplashOneScreen(),
                SplashTwoScreen(),
                SplashThreeScreen(),
                SplashFourScreen(),
                SplashFiveScreen(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              SmoothPageIndicator(
                controller: _controller,
                count: 5,
                axisDirection: Axis.horizontal,
                effect: const SlideEffect(
                  activeDotColor: Colors.red,
                  dotHeight: 15,
                  dotColor: Colors.grey,
                  dotWidth: 15,
                ),
              ),
              ValueListenableBuilder<int>(
                valueListenable: _currentPageNotifier,
                builder: (context, currentPage, _) {
                  return Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Container(
                      child: GestureDetector(
                        onTap: () {
                          _onTapImage(currentPage);
                          // if (_currentPageNotifier.value != 4) {
                          //   _controller.nextPage(
                          //     duration: Duration(milliseconds: 300),
                          //     curve: Curves.ease,
                          //   );
                          // }
                        },
                        child: Image.asset(_getIconForPage(currentPage),
                            height: 5.h),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 5.h),
        ],
      ),
    );
  }

  String _getIconForPage(int page) {
    switch (page) {
      case 0:
        return splashScreenOneNextImg;
      case 1:
        return splashScreenTwoNextImg;
      case 2:
        return splashScreenThreeNextImg;
      case 3:
        return splashScreenFourNextImg;
      case 4:
        return splashScreenFiveNextImg;
      default:
        return drawerImg;
    }
  }

}
