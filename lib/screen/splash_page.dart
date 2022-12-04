import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management/screen/onbording_page.dart';
import 'package:task_management/utls/colors.dart';
import 'package:task_management/widgets/textstyle.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
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
              HeadingText('RANCANG'),
              SizedBox(
                height: 8,
              ),
              SubTitleText('Your Personal Task Manager')
            ],
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 53),
            child: CustomButton(
              content: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubTitleText('Getting Started'),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                  )
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OnBordingPage(),
                    ));
              },
              // color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.content,
    this.color = const Color(0xff246BFD),
    required this.onTap,
  }) : super(key: key);
  final Widget content;
  final Color? color;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 56,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      color: color,
      onPressed: onTap,
      child: content,
    );
  }
}
