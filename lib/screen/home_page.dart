import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:task_management/model_class/mytask_data.dart';
import 'package:task_management/screen/tabbar_view.dart';
import 'package:task_management/screen/teammember_page.dart';

import 'package:task_management/utls/colors.dart';
import '../stepper/stepper_page.dart';
import '../widgets/textstyle.dart';

final projectTaskList = TaskManager.projectTastGenarate();
final myTaskList = TaskManager.myTaskGenarate();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      /*  floatingActionButton: SizedBox(
          width: 64,
          height: 64,
          child: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: kBackground,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                )),
                // shape: Border.all(width: 1, color: Colors.red),
                context: context,
                builder: (context) => AddProject(),
              );
            },
            child: Icon(
              Icons.add,
              size: 30,
            ),
          )), */
      // bottomNavigationBar: const CustomBottomNavigation(),
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: 16, right: 16, top: MediaQuery.of(context).padding.top),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      profileImage == null
                          ? Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kRotedBox,
                              ),
                              child: Center(
                                  child: ClipRRect(
                                borderRadius: BorderRadius.circular(500),
                                child: Image(
                                  image:
                                      AssetImage('assets/images/profile.jpg'),
                                  fit: BoxFit.cover,
                                  height: 31,
                                  width: 31,
                                ),
                              )))
                          : Container(
                              height: 32,
                              width: 32,
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
                                    height: 33,
                                    width: 33,
                                  ),
                                ),
                              )),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: HeadingText(
                          'Parto Team',
                          fs: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TeamMemberPage())),
                        child: Transform.rotate(
                            angle: pi / -2,
                            child: Icon(
                              Icons.arrow_back_ios_outlined,
                              size: 16,
                              color: kLabelTextColor,
                            )),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 2.29),
                        child: Icon(
                          Icons.search,
                          color: kLabelTextColor,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
            child: HeadingText(
              'Project Task',
              fs: 16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Container(
              height: 57,
              width: double.infinity,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TabrBarVie(
                                  taskManager: projectTaskList[index],
                                ),
                              ));
                        },
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: kLogoBacground,
                              ),
                              width: 128,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: 4,
                                  height: 32,
                                  color: projectTaskList[index].color,
                                ),
                              ),
                            ),
                            Positioned(
                                left: 28,
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Center(
                                          child: HeadingText(
                                              projectTaskList[index]
                                                  .progress
                                                  .toString())),
                                    ),
                                    SizedBox(
                                      // width: 48,
                                      child: TextFieldText(
                                        '${projectTaskList[index].subTitle}',
                                        ls: -.0008,
                                        color: Color(0xffE9E9EB),
                                        fs: 12,
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(width: 8),
                  itemCount: projectTaskList.length),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeadingText(
                  'My Task',
                  color: Color(0xffF8F8F8),
                  fs: 16,
                ),
                TextFieldText(
                  'See More',
                  color: Color(0xffE9E9EB),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Container(
                          height: 108,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: kLogoBacground,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 11, top: 19),
                                      child: Icon(
                                        Icons.check_box_outlined,
                                        color: kLoginSuccessTextColor,
                                      ),
                                    )),
                                Expanded(
                                    flex: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextFieldText(
                                                myTaskList[index]
                                                    .title
                                                    .toString(),
                                                color: kLabelTextColor,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    color: myTaskList[index]
                                                                    .mark! >
                                                                8 &&
                                                            myTaskList[index]
                                                                    .mark! <
                                                                20
                                                        ? Colors.greenAccent
                                                        : myTaskList[index]
                                                                        .mark! >
                                                                    4 &&
                                                                myTaskList[index]
                                                                        .mark! <
                                                                    8
                                                            ? Colors.lightGreen
                                                            : Colors.redAccent),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 16,
                                                      vertical: 4),
                                                  child: TextFieldText(
                                                    myTaskList[index]
                                                        .progress
                                                        .toString(),
                                                    color: kLabelTextColor,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 16),
                                                  child: SizedBox(
                                                    // width: 100,
                                                    height: 8,
                                                    child: Stack(
                                                      // fit: StackFit.loose,

                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16),
                                                            color: Color(
                                                                0xff363748),
                                                          ),
                                                        ),
                                                        LayoutBuilder(
                                                          builder:
                                                              (context, width) {
                                                            return Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16),
                                                                  color: myTaskList[index].mark! >
                                                                              0 &&
                                                                          myTaskList[index].mark! <=
                                                                              5
                                                                      ? Colors
                                                                          .red
                                                                      : myTaskList[index].mark! > 5 &&
                                                                              myTaskList[index].mark! <=
                                                                                  9
                                                                          ? Colors
                                                                              .blueGrey
                                                                          : myTaskList[index].mark! > 9 && myTaskList[index].mark! <= 20
                                                                              ? Colors.greenAccent
                                                                              : Colors.transparent,
                                                                ),
                                                                width: width
                                                                        .maxWidth *
                                                                    myTaskList[
                                                                            index]
                                                                        .mark!
                                                                        .toDouble() /
                                                                    20);
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )),
                                                SizedBox(
                                                  // color: kButtonBackground,
                                                  width: 40,
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: TextFieldText(
                                                      myTaskList[index].mark! <
                                                                  0 ||
                                                              myTaskList[index]
                                                                      .mark! >
                                                                  20
                                                          ? '00/00'
                                                          : '${myTaskList[index].mark}/20',
                                                      color: kLabelTextColor,
                                                      ls: .0008,
                                                      fs: 12,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8),
                                                  child: Icon(
                                                    Icons.circle,
                                                    color: Color(0xff76BBAA),
                                                    size: 10,
                                                  ),
                                                ),
                                                TextFieldText(
                                                  '2 Days Left',
                                                  fs: 12,
                                                  ls: 0.0008,
                                                  color: kLabelTextColor,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(height: 8),
                  itemCount: 5))
        ],
      ),
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
