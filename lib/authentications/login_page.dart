import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/authentications/signup_page.dart';
// import 'package:task_management/screen/signup_page.dart';
import '../utls/custombutton.dart';
import 'package:task_management/utls/colors.dart';
import 'package:task_management/widgets/textstyle.dart';

final TextEditingController emaliController = TextEditingController();
final TextEditingController passController = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 21.21, top: 21.21, bottom: 21.21),
            child: SvgPicture.asset(
              'assets/icons/cross.svg',
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 17, bottom: 17),
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpPage(),
                  )),
              child: TextFieldText(
                'Sing Up',
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
              controller: emaliController,
              svgPicture: SvgPicture.asset(
                'assets/icons/mail.svg',
              ),
              hintText: 'Enter your email address',
              padding: const EdgeInsets.symmetric(horizontal: 18),
            ),
            SizedBox(height: 16),
            CustomTextField(
              obscureText: true,
              titleTextFiedl: 'Your Password',
              textInputType: TextInputType.visiblePassword,
              controller: passController,
              svgPicture: SvgPicture.asset(
                'assets/icons/pass.svg',
              ),
              hintText: 'Enter your password',
              padding: const EdgeInsets.symmetric(horizontal: 21.5),
            ),
            SizedBox(height: 16),
            CustomButton(
              text: 'Login',
              onTap: () {},
            ),
            SizedBox(height: 41),
            Align(
              child: GestureDetector(
                onTap: () {},
                child: TextFieldText(
                  'Forgot Your Password',
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 53),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    this.svgPicture,
    required this.hintText,
    required this.padding,
    this.textInputType,
    this.titleTextFiedl,
    this.obscureText = false,
  }) : super(key: key);
  final TextEditingController controller;
  final SvgPicture? svgPicture;
  final String hintText;
  final EdgeInsetsGeometry padding;
  final TextInputType? textInputType;
  final String? titleTextFiedl;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldText(
          '${titleTextFiedl ?? 'ROY'}',
          color: kLabelTextColor,
        ),
        SizedBox(height: 12),
        TextFormField(
          obscureText: obscureText,
          keyboardType: textInputType,
          style: myTextStyle(color: Colors.white),
          controller: controller,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(color: kButtonBackground)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide(color: kTextFieldShap),
            ),
            hintText: hintText,
            hintStyle: myTextStyle(),
            prefixIcon: Padding(
              padding: padding,
              child: svgPicture,
            ),
            // prefixIconConstraints: BoxConstraints(maxHeight: 20),
          ),
        ),
      ],
    );
  }
}

bool isClick = true;
