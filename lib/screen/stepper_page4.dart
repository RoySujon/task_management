import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:task_management/screen/login_page.dart';
import '../authentications/login_page.dart';
import '../model_class/stepper_page5.dart';
import '../utls/custombutton.dart';
// import 'package:task_management/screen/stepper_page5.dart';
import 'package:task_management/utls/colors.dart';

import '../widgets/textstyle.dart';

final TextEditingController teamCodeController = TextEditingController();

class StepperPage4 extends StatefulWidget {
  const StepperPage4({super.key});

  @override
  State<StepperPage4> createState() => _StepperPage4State();
}

class _StepperPage4State extends State<StepperPage4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        // title: ,
        title: SvgPicture.asset('assets/icons/slider3.svg'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
            child: SvgPicture.asset(
              'assets/icons/arrow_chevron_left.svg',
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Center(
                  child: TextFieldText(
                'Enter Your Code Team',
                color: kLabelTextColor,
                fontWeight: FontWeight.w700,
              )),
              SizedBox(height: 16),
              CustomTextField(
                  obscureText: true,
                  titleTextFiedl: 'Code Team',
                  controller: teamCodeController,
                  svgPicture: SvgPicture.asset(
                    'assets/icons/pass.svg',
                  ),
                  hintText: 'e.g JXHJKH',
                  padding: EdgeInsets.symmetric(horizontal: 21.5)),
              SizedBox(height: 212),
              CustomButton(
                text: 'Continue',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StepperPage5()));
                },
              ),
              SizedBox(height: 53),
            ],
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