import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:task_management/utls/colors.dart';
import 'package:task_management/widgets/textstyle.dart';
import '../utls/custombutton.dart';
import 'onbording_page.dart';

class SplashPage2 extends StatefulWidget {
  const SplashPage2({super.key});

  @override
  State<SplashPage2> createState() => _SplashPage2State();
}

class _SplashPage2State extends State<SplashPage2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Container(
                    padding: EdgeInsets.all(33),
                    decoration: BoxDecoration(
                        color: kLogoBacground,
                        borderRadius: BorderRadius.circular(8)),
                    child: SvgPicture.asset(
                      "assets/icons/roy.svg",
                      height: 30,
                    ),
                  ),
                ),
              ),
              HeadingText('TASK MANAGER'),
              SizedBox(
                height: 8,
              ),
              SubTitleText('Your Personal Task Manager'),
            ],
          )),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
            child: CustomButton(
              alinment: Alignment.centerLeft,
              text: 'Get Started',
              onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OnBordingPage(),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
