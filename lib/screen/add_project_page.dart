import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/model_class/mytask_data.dart';
import 'package:task_management/screen/login_page.dart';
import 'package:task_management/screen/splash_page.dart';
import '../widgets/textstyle.dart';

final TextEditingController projectNameController = TextEditingController();
final TextEditingController selectTeamController = TextEditingController();
final TextEditingController prograssController = TextEditingController();
final TextEditingController timeLineController = TextEditingController();

final projectTaskList = TaskManager.projectTastGenarate();
final myTaskList = TaskManager.myTaskGenarate();

class AddProject extends StatefulWidget {
  const AddProject({super.key});

  @override
  State<AddProject> createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HeadingText(
                      'Add New Project',
                      fs: 16,
                      color: Color(0xffF8F8F8),
                    ),
                    SvgPicture.asset('assets/icons/cross.svg')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CustomTextField(
                    titleTextFiedl: 'Project Name',
                    controller: projectNameController,
                    svgPicture: SvgPicture.asset('assets/icons/suitcase.svg'),
                    hintText: 'Enter Project Name',
                    padding: EdgeInsets.symmetric(horizontal: 16)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CustomTextField(
                    titleTextFiedl: 'Select Your Team',
                    controller: selectTeamController,
                    svgPicture: SvgPicture.asset('assets/icons/Add Person.svg'),
                    hintText: 'Select Your Team',
                    padding: EdgeInsets.symmetric(horizontal: 16)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CustomTextField(
                    titleTextFiedl: 'Progress',
                    controller: prograssController,
                    svgPicture:
                        SvgPicture.asset('assets/icons/Calendar Check.svg'),
                    hintText: 'Ongoing',
                    padding: EdgeInsets.symmetric(horizontal: 16)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: CustomTextField(
                    titleTextFiedl: 'Timeline',
                    controller: timeLineController,
                    svgPicture: SvgPicture.asset('assets/icons/calendar.svg'),
                    hintText: '2 March 2021',
                    padding: EdgeInsets.symmetric(horizontal: 16)),
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/Link.svg'),
                  Padding(
                    padding: const EdgeInsets.only(left: 17.64),
                    child: HeadingText(
                      'Attched Files',
                      fs: 16,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 27),
                child: CustomButton(
                  content: SubTitleText('Save'),
                  onTap: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
