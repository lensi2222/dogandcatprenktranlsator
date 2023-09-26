import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewWithIndicator extends StatefulWidget {
  @override
  _PageViewWithIndicatorState createState() => _PageViewWithIndicatorState();
}

class _PageViewWithIndicatorState extends State<PageViewWithIndicator> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<String> _pageTitles = ['Page 1', 'Page 2', 'Page 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView with SmoothPageIndicator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: _pageTitles.map((title) => Center(child: Text(title))).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: _pageTitles.length,
              effect: WormEffect(), // Choose your desired effect
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (_currentPage > 0) {
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Text('Previous'),
              ),
              SizedBox(width: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_currentPage < _pageTitles.length - 1) {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
