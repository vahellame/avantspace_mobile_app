import 'dart:ui';

import 'package:flutter/material.dart';

class ViewConfigColors {
  static const Color bg = Color(0xffF3F6FB);

  static const Color emphasisHigh = Color.fromRGBO(0, 0, 0, 0.87);
  static const Color emphasisMedium = Color.fromRGBO(0, 0, 0, 0.6);
  static const Color emphasisDisabled = Color.fromRGBO(0, 0, 0, 0.38);
  static const Color emphasisOutline = Color.fromRGBO(0, 0, 0, 0.12);

  static const Color primary700 = Color(0xff0000FC);
  static const Color primary600 = Color(0xff3B0EFF);
  static const Color primary300 = Color(0xff7645FF);

  static const Color primaryOverlaySelected = Color.fromRGBO(0, 0, 252, 0.08);
}

class ViewConfigTextStyles {
  static TextStyle headline1(Color color) => TextStyle(
        fontFamily: 'Raleway',
        fontFeatures: const [
          FontFeature.liningFigures(),
        ],
        fontWeight: FontWeight.w300,
        fontSize: 98,
        height: 112 / 98,
        letterSpacing: -1.5,
        color: color,
        leadingDistribution: TextLeadingDistribution.even,
      );
  static TextStyle headline2(Color color) => TextStyle(
        fontFamily: 'Raleway',
        fontFeatures: const [
          FontFeature.liningFigures(),
        ],
        fontWeight: FontWeight.w300,
        fontSize: 61,
        height: 72 / 61,
        letterSpacing: 0.5,
        color: color,
        leadingDistribution: TextLeadingDistribution.even,
      );
  static TextStyle headline3(Color color) => TextStyle(
        fontFamily: 'Raleway',
        fontFeatures: const [
          FontFeature.liningFigures(),
        ],
        fontWeight: FontWeight.w400,
        fontSize: 49,
        height: 56 / 49,
        letterSpacing: 0.25,
        color: color,
        leadingDistribution: TextLeadingDistribution.even,
      );
  static TextStyle headline4(Color color) => TextStyle(
        fontFamily: 'Raleway',
        fontFeatures: const [
          FontFeature.liningFigures(),
        ],
        fontWeight: FontWeight.w400,
        fontSize: 35,
        height: 36 / 35,
        letterSpacing: 0.25,
        color: color,
        leadingDistribution: TextLeadingDistribution.even,
      );
  static TextStyle headline5(Color color) => TextStyle(
        fontFamily: 'Raleway',
        fontFeatures: const [
          FontFeature.liningFigures(),
        ],
        fontWeight: FontWeight.w400,
        fontSize: 24,
        height: 24 / 24,
        color: color,
        leadingDistribution: TextLeadingDistribution.even,
      );
  static TextStyle headline6(Color color) => TextStyle(
        fontFamily: 'Raleway',
        fontFeatures: const [
          FontFeature.liningFigures(),
        ],
        fontWeight: FontWeight.w600,
        fontSize: 20,
        height: 24 / 24,
        letterSpacing: 0.15,
        color: color,
        leadingDistribution: TextLeadingDistribution.even,
      );

  static TextStyle subtitle1(Color color) => TextStyle(
        fontFamily: 'Raleway',
        fontFeatures: const [
          FontFeature.liningFigures(),
        ],
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 24 / 16,
        letterSpacing: 0.15,
        color: color,
        leadingDistribution: TextLeadingDistribution.even,
      );
  static TextStyle subtitle2(Color color) => TextStyle(
        fontFamily: 'Raleway',
        fontFeatures: const [
          FontFeature.liningFigures(),
        ],
        fontWeight: FontWeight.w600,
        fontSize: 14,
        height: 24 / 14,
        letterSpacing: 0.1,
        color: color,
        leadingDistribution: TextLeadingDistribution.even,
      );

  static TextStyle body1(Color color) => TextStyle(
        fontFamily: 'Raleway',
        fontFeatures: const [
          FontFeature.liningFigures(),
        ],
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 24 / 16,
        letterSpacing: 0.5,
        color: color,
        leadingDistribution: TextLeadingDistribution.even,
      );
  static TextStyle body2(Color color) => TextStyle(
        fontFamily: 'Raleway',
        fontFeatures: const [
          FontFeature.liningFigures(),
        ],
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 20 / 14,
        letterSpacing: 0.25,
        color: color,
        leadingDistribution: TextLeadingDistribution.even,
      );

  static TextStyle button(Color color) => TextStyle(
        fontFamily: 'Raleway',
        fontFeatures: const [
          FontFeature.liningFigures(),
        ],
        fontWeight: FontWeight.w600,
        fontSize: 14,
        height: 16 / 14,
        letterSpacing: 1.25,
        color: color,
        leadingDistribution: TextLeadingDistribution.even,
      );
  static TextStyle caption(Color color) => TextStyle(
        fontFamily: 'Raleway',
        fontFeatures: const [
          FontFeature.liningFigures(),
        ],
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 16 / 12,
        letterSpacing: 0.4,
        color: color,
        leadingDistribution: TextLeadingDistribution.even,
      );
  static TextStyle overline(Color color) => TextStyle(
        fontFamily: 'Raleway',
        fontFeatures: const [
          FontFeature.liningFigures(),
        ],
        fontWeight: FontWeight.w400,
        fontSize: 10,
        height: 16 / 10,
        letterSpacing: 1.5,
        color: color,
        leadingDistribution: TextLeadingDistribution.even,
      );
}

class ViewConfigShadows {
  static const List<BoxShadow> dp01 = [
    BoxShadow(
      offset: Offset(0, 1),
      blurRadius: 1.0,
      spreadRadius: 0.0,
      color: Color.fromRGBO(0, 0, 0, 0.14),
    ),
    BoxShadow(
      offset: Offset(0, 2),
      blurRadius: 1.0,
      spreadRadius: 0.0,
      color: Color.fromRGBO(0, 0, 0, 0.12),
    ),
    BoxShadow(
      offset: Offset(0, 1),
      blurRadius: 3.0,
      spreadRadius: 0.0,
      color: Color.fromRGBO(0, 0, 0, 0.20),
    ),
  ];
}
