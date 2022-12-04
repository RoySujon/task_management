import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/utls/colors.dart';
import 'package:task_management/widgets/textstyle.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kLogoBacground,
      height: 96,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10, left: 18, right: 18, bottom: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavBarButton(
                    assetName: 'assets/icons/roy.svg',
                    iconTile: 'My Task',
                  ),
                  NavBarButton(
                    assetName: 'assets/icons/calendar.svg',
                    iconTile: 'Calendar',
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavBarButton(
                    assetName: 'assets/icons/document.svg',
                    iconTile: 'Project',
                  ),
                  NavBarButton(
                    assetName: 'assets/icons/profile.svg',
                    iconTile: 'Profile',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavBarButton extends StatelessWidget {
  const NavBarButton({
    Key? key,
    required this.assetName,
    required this.iconTile,
  }) : super(key: key);
  final String assetName;
  final String iconTile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 11),
            child: SvgPicture.asset(
              assetName,
              height: 24,
            ),
          ),
          TextFieldText(
            iconTile,
            fs: 10,
            color: kLabelTextColor,
          ),
        ],
      ),
    );
  }
}

class BlunkNavigationBar extends StatelessWidget {
  const BlunkNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kLogoBacground,
      height: 96,
    );
  }
}
