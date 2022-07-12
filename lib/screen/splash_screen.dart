import 'dart:ffi';

import 'package:design_flutter/screen/intro_screen/intro_page1.dart';
import 'package:design_flutter/screen/intro_screen/intro_page2.dart';
import 'package:design_flutter/screen/intro_screen/intro_page3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _controller = PageController();
  bool onLastpage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastpage = (index == 2);
              });
            },
            children: const [IntroPage1(), IntroPage2(), IntroPage3()],
          ),
          Container(
              alignment: const Alignment(0, 0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: const Text('Skip'),
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                  ),
                  SmoothPageIndicator(controller: _controller, count: 3),
                  onLastpage
                      ? GestureDetector(
                          child: const Text('Done'),
                          onTap: () {
                            print('done');
                            // _controller.nextPage(
                            //     duration: const Duration(milliseconds: 500),
                            //     curve: Curves.easeIn);
                          },
                        )
                      : GestureDetector(
                          child: const Text('Next'),
                          onTap: () {
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                        ),
                ],
              ))
        ],
      ),
    );
  }
}
