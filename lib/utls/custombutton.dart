import 'package:flutter/material.dart';
import 'package:task_management/widgets/textstyle.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    this.color = const Color(0xff246BFD),
    required this.onTap,
    this.alinment = Alignment.center,
  }) : super(key: key);
  // final Widget content;
  final Color color;
  final VoidCallback onTap;
  final String text;
  final AlignmentGeometry alinment;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 56,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      color: color,
      onPressed: onTap,
      child: Align(alignment: alinment, child: SubTitleText(text)),
    );
  }
}
