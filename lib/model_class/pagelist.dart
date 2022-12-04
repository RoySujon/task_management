import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/screen/home_page.dart';
import 'package:task_management/screen/login_page.dart';
import 'package:task_management/screen/teammember_page.dart';
// import 'package:task_management/screen/login_page.dart';
import 'package:task_management/utls/colors.dart';

import '../screen/add_project_page.dart';
import '../screen/tabbar_view.dart';

class PageList {
  PageList(this.page, this.icon, this.title);
  final Widget page;
  final String? icon;
  final String? title;
  static List<PageList> genaratePageList() {
    return [
      PageList(HomePage(), 'assets/icons/roy.svg', 'My Task'),
      PageList(LoginPage(), 'assets/icons/calendar.svg', 'Calendar'),
      PageList(TabrBarVie(), 'assets/icons/document.svg', 'Project'),
      PageList(TeamMemberPage(), 'assets/icons/profile.svg', 'Profile'),
    ];
  }
}

var pageList = [HomePage(), TabrBarVie(), TeamMemberPage(), LoginPage()];

final itemOfPage = PageList.genaratePageList();

class NavigaTionPageButtion extends StatefulWidget {
  const NavigaTionPageButtion({super.key});

  @override
  State<NavigaTionPageButtion> createState() => _NavigaTionPageButtionState();
}

class _NavigaTionPageButtionState extends State<NavigaTionPageButtion> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: itemOfPage.length,
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: SizedBox(
            height: 64,
            width: 64,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {});
                showModalBottomSheet(
                    backgroundColor: kBackground,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    )),
                    // shape: Border.all(width: 1, color: Colors.red),
                    context: context,
                    builder: (
                      context,
                    ) =>
                        AddProject());
              },
              child: Icon(Icons.add),
            ),
          ),
          bottomNavigationBar: Container(
            height: 96,
            color: kLogoBacground,
            child: TabBar(
                indicatorWeight: 0.5,
                // isScrollable: true,
                tabs: List.generate(
                  itemOfPage.length,
                  (index) => Tab(
                    icon: SvgPicture.asset(
                      itemOfPage[index].icon.toString(),
                    ),
                    text: itemOfPage[index].title,
                  ),
                )),
          ),
          body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(
                  itemOfPage.length, (index) => itemOfPage[index].page)),
        ));
  }
}
