import 'dart:math';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:task_management/model_class/page_data.dart';

import '../authentications/login_page.dart';
import '../authentications/signup_page.dart';
import '../utls/custombutton.dart';
// import 'package:task_management/utls/colors.dart';
import 'package:task_management/widgets/textstyle.dart';

final listItem = PageData.genaratePageDataList();
PageController pageController = PageController(/* viewportFraction: 0.95 */);
var currentPageValue = 0.0;

class OnBordingPage extends StatefulWidget {
  const OnBordingPage({super.key});

  @override
  State<OnBordingPage> createState() => _OnBordingPageState();
}

class _OnBordingPageState extends State<OnBordingPage> {
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: PageView.builder(
                controller: pageController,
                itemBuilder: (context, index) => SizedBox(
                      width: double.infinity,
                      child: Stack(children: [
                        Positioned(
                          top: -184,
                          right: -104,
                          left: -133,
                          child: Transform.rotate(
                            angle: pi / 5,
                            child: Container(
                              height: 480,
                              width: 395,
                              decoration: BoxDecoration(
                                // boxShadow: ,
                                color: listItem[index].color,
                                borderRadius: BorderRadius.circular(40),
                                image: DecorationImage(
                                    image: AssetImage(
                                        listItem[index].imageUrl.toString()),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: HeadingText(
                                  'Update Progress Your Work for The Team'),
                            ),
                          ],
                        ),
                      ]),
                    ),
                itemCount: listItem.length),
          ),
          // ignore: unnecessary_new
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Align(
              alignment: Alignment.topLeft,
              child: DotsIndicator(
                dotsCount: listItem.length,
                position: currentPageValue,
                decorator: DotsDecorator(
                  size: const Size.square(8),
                  activeSize: const Size(48.0, 8.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: CustomButton(
              text: 'Sign Up',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ));
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 40),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(28)),
              child: CustomButton(
                text: 'Login',
                color: Colors.transparent,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
