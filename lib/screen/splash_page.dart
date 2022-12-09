import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management/screen/onbording_page.dart';
import 'package:task_management/screen/splashscreen2.dart';
import 'package:task_management/utls/colors.dart';
import 'package:task_management/widgets/textstyle.dart';
import '../utls/custombutton.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(milliseconds: 1500),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SplashPage2(),
            )));
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
            ],
          )),
        ],
      ),
    );
  }
}
