import 'package:flutter/material.dart';

class CustomColors {
  const CustomColors();

  static const Color appBarTitle = const Color(0xFFFFFFFF);
  static const Color appBarIconColor = const Color(0xFFFFFFFF);
  static const Color appBarDetailBackground = const Color(0x00FFFFFF);
  static const Color appBarGradientStart = const Color(0xFF3383FC);
  static const Color appBarGradientEnd = const Color(0xFF00C6FF);

  //static const Color planetCard = const Color(0xFF434273);
  static const Color menuItemStyle = const Color(0xFF434273);

  //static const Color planetListBackground = const Color(0xFF3E3963);
  static const Color planetPageBackground = const Color(0xFF736AB7);
  static const Color drawerTitle = const Color(0xCC000000);
  static const Color drawerSecondary = const Color(0xCC000000);
  static const Color bottomStyle = const Color(0xFFAAAAAA);
  static const Color arcbarColor = const Color(0xFFFFFFFF);
  static const Color quizIconBoxStyle = const Color(0xFF000000);
  static const Color whiteCol = const Color(0xFFFFFFFF);
  static const List<Color> mainQuizLinearColors = [
    Colors.lightBlueAccent,
    Colors.lightBlue
  ];
  static const List<Color> rightAnswerColors = [
    Colors.lightGreenAccent,
    Colors.lightGreen
  ];
  static const List<Color> wrongAnswerColors = [
    Colors.deepOrangeAccent,
    Colors.deepOrange
  ];
}

class Dimens {
  const Dimens();

  static const planetWidth = 100.0;
  static const planetHeight = 100.0;
  static const statusbarHeight = 56.0;
}

class TextStyles {
  const TextStyles();

  static const TextStyle appBarTitle = const TextStyle(
      color: CustomColors.appBarTitle,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w100,
      fontSize: 20.0);

  static const TextStyle drawerPrimary = const TextStyle(
      color: CustomColors.drawerTitle,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w600,
      fontSize: 24.0);

  static const TextStyle drawerSecondary = const TextStyle(
      color: CustomColors.drawerSecondary,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w300,
      fontSize: 14.0);

  static const TextStyle bottomStyle = const TextStyle(
      color: CustomColors.bottomStyle,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w100,
      fontSize: 14.0);

  static const TextStyle menuItemStyle = const TextStyle(
      color: CustomColors.menuItemStyle,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w800,
      fontSize: 20.0);

  static const TextStyle arcbarStyle = const TextStyle(
      color: CustomColors.arcbarColor,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w800,
      fontSize: 20.0);

  static const TextStyle quizIconBoxStyle = const TextStyle(
      color: CustomColors.menuItemStyle,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w600,
      fontSize: 16.0);

  static const TextStyle quizIconBoxSelectStyle = const TextStyle(
      color: CustomColors.whiteCol,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w600,
      fontSize: 16.0);

  static const TextStyle quizQutionStyle = const TextStyle(
      color: CustomColors.whiteCol,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w500,
      fontSize: 22.0);

  static const TextStyle quizQutionHeaderStyle = const TextStyle(
      color: CustomColors.whiteCol,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w400,
      fontSize: 16.0);

  static const TextStyle quizQutionSubHeaderStyle = const TextStyle(
      color: Colors.white70,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w400,
      fontSize: 14.0);

  static const TextStyle defaultAnswerStyle = const TextStyle(
      color: Colors.black87,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w600,
      fontSize: 16.0);

  static const TextStyle correctAnswerStyle = const TextStyle(
      color: Colors.black,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w600,
      fontSize: 16.0);
}
