import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubTitleText extends StatelessWidget {
  const SubTitleText(
    this.text, {
    super.key,
    this.fs = 17,
  });
  final String text;
  final double? fs;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.nunito(
            fontSize: fs, fontWeight: FontWeight.w600, color: Colors.white));
  }
}

class HeadingText extends StatelessWidget {
  const HeadingText(this.text,
      {super.key,
      this.fontWeight = FontWeight.w700,
      this.fs = 36,
      this.color = const Color(0xffE4E4E6),
      this.of,
      this.ml});
  final String text;
  final FontWeight? fontWeight;
  final double? fs;
  final Color? color;
  final TextOverflow? of;
  final int? ml;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: of,
        maxLines: ml,
        style: GoogleFonts.nunito(
            fontSize: fs, fontWeight: fontWeight, color: color));
  }
}

class TextFieldText extends StatelessWidget {
  const TextFieldText(this.text,
      {super.key,
      this.color = const Color(0xff8A8A8E),
      this.fontWeight = FontWeight.w400,
      this.textAlign,
      this.fs = 16,
      this.ls = 0.3,
      this.of,
      this.ml});
  final String text;
  final Color? color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final double? fs;
  final double? ls;
  final TextOverflow? of;
  final int? ml;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        overflow: of,
        maxLines: ml,
        style: GoogleFonts.nunito(
            letterSpacing: ls,
            fontSize: fs,

            // height: 21,
            fontWeight: fontWeight,
            color: color));
  }
}

TextStyle myTextStyle(
    {Color color = const Color(0xff8A8A8E),
    FontWeight fontWeight = FontWeight.w400}) {
  return GoogleFonts.nunito(
      letterSpacing: .3,
      fontSize: 16,
      // height: 21,
      fontWeight: fontWeight,
      color: color);
}
