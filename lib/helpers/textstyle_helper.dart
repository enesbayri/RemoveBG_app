import 'package:flutter/material.dart';
import 'package:flutter_application_19/helpers/color_helper.dart';

class UiTextStyleHelper {
  static TextStyle titleTextStyle(context) => TextStyle(
      fontFamily: "RubikGlitch", //Color.fromARGB(255, 39, 121, 235)
      fontSize: MediaQuery.of(context).size.width * 0.1,
      color: UiColorHelper.mainYellow);
  static TextStyle titleWhiteTextStyle(context) => TextStyle(
      fontFamily: "RubikGlitch",
      fontSize: MediaQuery.of(context).size.width * 0.1,
      color: UiColorHelper.mainWhite);

  static TextStyle downloadButton = TextStyle(
      fontFamily: "Nunito",
      fontSize: 18,
      letterSpacing: 3,
      fontWeight: FontWeight.w300,
      color: UiColorHelper.mainWhite);
}
