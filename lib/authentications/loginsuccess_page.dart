import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management/model_class/pagelist.dart';
import '../stepper/stepper_page.dart';
import '../utls/custombutton.dart';

import 'package:task_management/utls/colors.dart';
import '../widgets/textstyle.dart';

class LoginSucess extends StatefulWidget {
  const LoginSucess({super.key});

  @override
  State<LoginSucess> createState() => _LoginSucessState();
}

class _LoginSucessState extends State<LoginSucess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        // title: ,
        // title: SvgPicture.asset('assets/icons/slider.svg'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        /*  leading: Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
            child: SvgPicture.asset(
              'assets/icons/arrow_chevron_left.svg',
            )), */
      ),
      body: Align(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: 397,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: kBackground,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  profileImage == null
                      ? Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kRotedBox,
                          ),
                          child: Center(
                              child: ClipRRect(
                            borderRadius: BorderRadius.circular(500),
                            child: Image(
                              image: AssetImage('assets/images/profile.jpg'),
                              fit: BoxFit.cover,
                              height: 115,
                              width: 115,
                            ),
                          )))
                      : Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kRotedBox,
                            // image: DecorationImage(
                            //     image: FileImage(File(profileImage!.path)),
                            //     fit: BoxFit.cover),
                          ),
                          child: Center(
                            child: ClipOval(
                              child: Image(
                                image: FileImage(File(profileImage!.path)),
                                fit: BoxFit.cover,
                                height: 115,
                                width: 115,
                              ),
                            ),
                          )),
                  Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 8),
                    child: HeadingText(
                      'Congratulations!',
                      color: Color(0xffF8F8F8),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: TextFieldText(
                      'Parto team was created successfully, create your latest project so you can work with your team.',
                      textAlign: TextAlign.center,
                      color: kLoginSuccessTextColor,
                    ),
                  ),
                  CustomButton(
                    text: 'Next',
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const NavigaTionPageButtion()),
                          (route) => false);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

int currentStep = 0;

class SteperTextField extends StatelessWidget {
  const SteperTextField({
    Key? key,
    required this.controller,
    required this.svgPicture,
    required this.hintText,
    required this.padding,
    this.textInputType,
    this.obscureText = false,
  }) : super(key: key);
  final TextEditingController controller;
  final SvgPicture svgPicture;
  final String hintText;
  final EdgeInsetsGeometry padding;
  final TextInputType? textInputType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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






/* 
 Stepper(
                  onStepTapped: (value) {
                    setState(() {});
                    value = currentStep;
                  },
                  currentStep: currentStep,
                  physics: NeverScrollableScrollPhysics(),
                  onStepContinue: (() {
                    setState(() {
                      if (currentStep < 2) {
                        currentStep++;
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                      }
                    });
                  }),
                  onStepCancel: () => setState(() {
                        if (currentStep > 0) {
                          currentStep--;
                        }
                      }),
                  steps: [
                    Step(

                        // isActive: currentStep >= 0,
                        // state: currentStep >= 0
                        //     ? StepState.editing
                        //     : StepState.disabled,

                        // state: StepState.editing,
                        state: currentStep == 0
                            ? StepState.editing
                            : StepState.complete,
                        isActive: currentStep > 0 ? true : false,
                        title: TextFieldText('NAME'),
                        content: SteperTextField(
                          textInputType: TextInputType.emailAddress,
                          controller: emaliController,
                          svgPicture: SvgPicture.asset(
                            'assets/icons/profile.svg',
                          ),
                          hintText: 'Enter your full name',
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                        )),
                    Step(
                        state: currentStep == 1
                            ? StepState.editing
                            : StepState.complete,
                        isActive: currentStep > 1 ? true : false,
                        // isActive: currentStep >= 0,
                        // state: currentStep >= 0
                        //     ? StepState.editing
                        //     : StepState.disabled,

                        // state: StepState.editing,

                        title: TextFieldText('EMAIL'),
                        content: SteperTextField(
                          textInputType: TextInputType.emailAddress,
                          controller: emaliController,
                          svgPicture: SvgPicture.asset(
                            'assets/icons/mail.svg',
                          ),
                          hintText: 'Enter your full name',
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                        )),
                    Step(
                        state: currentStep == 2
                            ? StepState.editing
                            : StepState.complete,
                        isActive: currentStep > 2 ? true : false,
                        // isActive: currentStep >= 0,
                        // state: currentStep >= 0
                        //     ? StepState.editing
                        //     : StepState.disabled,

                        // state: StepState.editing,

                        title: TextFieldText('PASSWORD'),
                        content: SteperTextField(
                          obscureText: true,
                          textInputType: TextInputType.datetime,
                          controller: emaliController,
                          svgPicture: SvgPicture.asset(
                            'assets/icons/pass.svg',
                          ),
                          hintText: 'Enter your full name',
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                        )),
                  ]), */