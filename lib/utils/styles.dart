import 'package:flutter/material.dart';

class Stylings {
  //Colors
  static Color main = Colors.purple.shade700;
  static Color deepblack = Colors.black;
  static Color lightblack = Colors.black45;
  static Color bgColor = const Color(0xffeeedf2);

//textStyles
  static TextStyle header = TextStyle(
    fontFamily: "WorkSans",
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: deepblack
  );
  static TextStyle subHeader = TextStyle(
      fontFamily: "WorkSans",
      fontSize: 13,
      fontWeight: FontWeight.w700,
      color: deepblack
  );
  static TextStyle lilgreyText = TextStyle(
      fontFamily: "WorkSans",
      fontSize: 12,
      color: lightblack,
      fontWeight: FontWeight.w400
  );
//media
  static String imgPath = "assets";
}