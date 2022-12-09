import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management/model_class/mytask_data.dart';

// import 'package:task_management/model_class/mytask_data.dart';
import 'package:task_management/utls/colors.dart';
import 'package:task_management/widgets/textstyle.dart';

import 'invite_member.dart';

// import 'bottom_navigation.dart';
final myTaskList = TaskManager.myTaskGenarate();

class TeamMemberPage extends StatefulWidget {
  const TeamMemberPage({super.key});

  @override
  State<TeamMemberPage> createState() => _TeamMemberPageState();
}

class _TeamMemberPageState extends State<TeamMemberPage> {
  @override
  Widget build(BuildContext context) {
    showModalBottonSHeet() {
      showModalBottomSheet(
        backgroundColor: kBackground,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        )),
        // shape: Border.all(width: 1, color: Colors.red),
        context: context,
        builder: (context) => InviteMemberPage(),
      );
    }

    return Scaffold(
      floatingActionButton: SizedBox(
          width: 64,
          height: 64,
          child: FloatingActionButton(
            onPressed: () {
              showModalBottonSHeet();
            },
            child: Icon(
              Icons.add,
              size: 30,
            ),
          )),
      // bottomNavigationBar: const BlunkNavigationBar(),
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        // title: ,
        title: HeadingText(
          'Parto Team',
          fs: 16,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(
                'assets/icons/arrow_chevron_left.svg',
              ),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: GridView.count(
                  // padding: EdgeInsets.all(5),
                  // physics: NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children: List.generate(
                      myTaskList.length,
                      (index) => CustomeGride(
                          titleText: myTaskList[index].title,
                          color: myTaskList[index].color))),
            )
          ],
        ),
      ),
    );
  }
}

class CustomeGride extends StatelessWidget {
  const CustomeGride({
    Key? key,
    this.titleText,
    this.color,
    this.mail,
  }) : super(key: key);
  final String? titleText;
  final Color? color;
  final String? mail;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kLogoBacground,
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: kRotedBox,
                      // backgroundImage: FileImage(File(profileImage!.path)),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Icon(
                        Icons.circle,
                        color: color == null ? Colors.amber : color,
                        size: 12,
                      ),
                    )
                  ],
                ),
                SvgPicture.asset('assets/icons/More Vertical.svg')
              ],
            ),
          ),
          HeadingText(
            titleText == null ? 'MY Degignation' : titleText.toString(),
            fs: 16,
            ml: 1,
            of: TextOverflow.ellipsis,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: TextFieldText(
              mail == null ? 'goutomroy770@gmai.com' : mail.toString(),
              ml: 1,
              of: TextOverflow.ellipsis,
              fs: 12,
            ),
          )
        ],
      ),
    );
  }
}
