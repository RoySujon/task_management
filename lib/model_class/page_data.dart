import 'package:flutter/animation.dart';
import 'package:task_management/utls/colors.dart';

class PageData {
  PageData(this.color, this.onBordinTitle, this.imageUrl);
  final Color? color;
  final String? onBordinTitle;
  final String? imageUrl;
  static List<PageData> genaratePageDataList() {
    return [
      PageData(kRotedBox, 'Update Progress Your Work for The Team',
          'assets/images/background1.jpeg'),
      PageData(kRotedBox, 'Create a Task and Assign it to Your Team Members',
          'assets/images/background2.jpeg'),
      PageData(kRotedBox, 'Get Notified when you Get a New Assignment',
          'assets/images/background4.jpeg'),
    ];
  }
}
