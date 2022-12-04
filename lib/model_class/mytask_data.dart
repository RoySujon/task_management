import 'package:flutter/material.dart';
import 'package:task_management/screen/home_page.dart';
import 'package:task_management/screen/project_page.dart';

class TaskManager {
  TaskManager({
    // this.onTap,
    this.rong,
    this.rank,
    this.color,
    this.title,
    this.subTitle,
    this.progress,
    this.day,
    this.mark,
    this.height,
  });
  final Color? color;
  final String? title;
  final String? subTitle;
  final String? progress;
  final String? day;
  final int? mark;
  final double? height;
  final double? rank;
  final Mycolor? rong;
  // final Widget? onTap;

  static List<TaskManager> projectTastGenarate() {
    return [
      TaskManager(
        rong: Mycolor.genarateColorlist()[0],
        color: const Color(0xff9C67F9),
        progress: '5',
        subTitle: 'Ongoing',
      ),
      TaskManager(
        color: Color(0xffF79293),
        progress: '7',
        subTitle: 'Under\nReview',
        rong: Mycolor.genarateColorlist()[3],
      ),
      TaskManager(
        color: Color(0xff76BBAA),
        progress: '4',
        subTitle: 'Uncoming',
        rong: Mycolor.genarateColorlist()[2],
      ),
      TaskManager(
        color: Color(0xff9C67F9),
        progress: '6',
        subTitle: 'Top Rate',
        rong: Mycolor.genarateColorlist()[1],
      ),
    ];
  }

  static List<TaskManager> myTaskGenarate() {
    return [
      TaskManager(
        color: Color(0xff9C67F9),
        title: 'Research Analysis',
        progress: 'Urgent',
        day: '2 Days Left',
        mark: 6,
        rank: 255,
      ),
      TaskManager(
        color: Color(0xff76BBAA),
        title: 'Research Analysis',
        progress: 'In Review',
        day: '2 Days Left',
        mark: 20,
        rank: 200,
        // onTap: HomePage(),
      ),
      TaskManager(
        color: Color(0xff76BBAA),
        title: 'Research Analysis',
        progress: 'In Review',
        day: '2 Days Left',
        mark: 20,
        rank: 200,
        // onTap: HomePage(),
      ),
      TaskManager(
          color: Color(0xff9C67F9),
          title: 'Research Analysis',
          progress: 'In Progress',
          day: '2 Days Left',
          mark: 5,
          rank: 190),
      TaskManager(
          color: Color(0xffff9C67F9),
          title: 'Research Analysis',
          progress: 'Approve',
          day: '2 Days Left',
          mark: 8,
          rank: 170),
      TaskManager(
          color: Color(0xffF79293),
          title: 'Research Analysis',
          progress: 'Urgent',
          day: '2 Days Left',
          mark: 8,
          rank: 150),
      TaskManager(
          color: Color(0xffF79293),
          title: 'Research Analysis',
          progress: 'Urgent',
          day: '2 Days Left',
          mark: 8,
          rank: 150),
      TaskManager(
          color: Color(0xffff9C67F9),
          title: null,
          progress: 'Approve',
          day: '2 Days Left',
          mark: 8,
          rank: 170),
    ];
  }
}

List<Color> ColorsData = [
  Color(0xff246BFD),
  Color(0xffF79293),
  Color(0xffFFBE3C),
  Color(0xff9C67F9),
  Color(0xff76BBAA),
  Color(0xffE6EBF8),
  Color(0xffFEEBF5),
  Color(0xffFFF6E4),
  Color(0xffF8F0FF),
  Color(0xffF8F0FF),
  Color(0xffDDEEEA),
  Color(0xffE4E4E6),
  Color(0xff8E8E93),
  Color(0xffAEAEB2),
  Color(0xffC7C7CC),
];

class Mycolor {
  Mycolor(this.color);
  final Color? color;
  static List<Mycolor> genarateColorlist() {
    return [
      Mycolor(
        Color(
          0xff246BFD,
        ),
      ),
      Mycolor(
        Color(0xffF79293),
      ),
      Mycolor(
        Color(0xffFFBE3C),
      ),
      Mycolor(
        Color(0xff246BFD),
      ),
      Mycolor(
        Color(0xff246BFD),
      ),
    ];
  }
}
