import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management/screen/splash_page.dart';
import 'package:task_management/screen/stepper_page.dart';

import '../widgets/textstyle.dart';
import 'login_page.dart';

final TextEditingController _signUpemailController = TextEditingController();

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding:
              const EdgeInsets.only(left: 21.21, top: 21.21, bottom: 21.21),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              'assets/icons/cross.svg',
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 17, bottom: 17),
            child: GestureDetector(
              onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  )),
              child: TextFieldText(
                'Log In',
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              textInputType: TextInputType.emailAddress,
              titleTextFiedl: 'Your Email Address',
              controller: _signUpemailController,
              svgPicture: SvgPicture.asset(
                'assets/icons/mail.svg',
              ),
              hintText: 'Enter your email address',
              padding: const EdgeInsets.symmetric(horizontal: 18),
            ),
            SizedBox(height: 16),
            CustomButton(
              content: SubTitleText('Continue'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => StepperPage()));
              },
            ),
            SizedBox(height: 53),
          ],
        ),
      ),
    );
    ;
  }
}
