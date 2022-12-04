import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/model_class/mytask_data.dart';
import 'package:task_management/screen/add_project_page.dart';
import 'package:task_management/screen/bottom_navigation.dart';
import 'package:task_management/utls/colors.dart';
import '../widgets/textstyle.dart';

List<int> isClick = [0, 1, 2, 3];
bool onTap = true;

final projectTaskList = TaskManager.projectTastGenarate();
final myTaskList = TaskManager.myTaskGenarate();

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      // floatingActionButton: SizedBox(
      //     width: 64,
      //     height: 64,
      //     child: FloatingActionButton(
      //       onPressed: () {
      //         showModalBottomSheet(
      //           backgroundColor: kBackground,
      //           shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.only(
      //             topLeft: Radius.circular(8),
      //             topRight: Radius.circular(8),
      //           )),
      //           // shape: Border.all(width: 1, color: Colors.red),
      //           context: context,
      //           builder: (context) => AddProject(),
      //         );
      //       },
      //       child: Icon(
      //         Icons.add,
      //         size: 30,
      //       ),
      //     )),
      // bottomNavigationBar: const CustomBottomNavigation(),
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: ListView.separated(
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Container(
                        // height: 137,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kLogoBacground,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 10,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextFieldText(
                                              myTaskList[index]
                                                  .progress
                                                  .toString(),
                                              color: kLabelTextColor,
                                            ),
                                            Row(
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
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15),
                                                  child: SvgPicture.asset(
                                                      'assets/icons/More Vertical.svg'),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      TextFieldText(
                                        'PT. Ikatan Cinta',
                                        fs: 12,
                                        color: kLabelTextColor,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 16),
                                              child: SizedBox(
                                                // width: 100,
                                                height: 8,
                                                child: Stack(
                                                  // fit: StackFit.loose,

                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        color:
                                                            Color(0xff363748),
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
                                                              color: myTaskList[index]
                                                                              .mark! >
                                                                          0 &&
                                                                      myTaskList[index]
                                                                              .mark! <=
                                                                          5
                                                                  ? Colors.red
                                                                  : myTaskList[index].mark! >
                                                                              5 &&
                                                                          myTaskList[index].mark! <=
                                                                              9
                                                                      ? Colors
                                                                          .blueGrey
                                                                      : myTaskList[index].mark! > 9 &&
                                                                              myTaskList[index].mark! <=
                                                                                  20
                                                                          ? Colors
                                                                              .greenAccent
                                                                          : Colors
                                                                              .transparent,
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
                                              width: 30,
                                              child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: TextFieldText(
                                                  myTaskList[index].mark! < 0 ||
                                                          myTaskList[index]
                                                                  .mark! >
                                                              20
                                                      ? '00/00'
                                                      : '${myTaskList[index].mark!.toInt() * 5}%',
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
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8),
                                              child: Icon(
                                                Icons.circle,
                                                color: Color(0xffffffff),
                                                size: 10,
                                              ),
                                            ),
                                            TextFieldText(
                                              '12 Tasks',
                                              fs: 12,
                                              ls: 0.0008,
                                              color: kLabelTextColor,
                                            ),
                                            Spacer(),
                                            Row(
                                                children: List.generate(
                                                    4,
                                                    (index) => Icon(
                                                          Icons.circle,
                                                          color: kCircleIcon,
                                                          size: 24,
                                                        )))
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(height: 8),
                itemCount: 5),
          ))
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
