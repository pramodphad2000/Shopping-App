import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSizes {
  static const double smallTextSize = 12.0;

  static double getTabletSize(BuildContext context, double size) {
    return size * (MediaQuery.of(context).size.width / 800);
  }

  static double getPhoneSize(BuildContext context, double size) {
    return size * (MediaQuery.of(context).size.width / 360);
  }

  static double getWebSize(BuildContext context, double size) {
    return size * (MediaQuery.of(context).size.width / 1920);
  }
    static double setHeight(double value) {
    return value.sh;
  }

  static double setWidth(double value) {
    return value.sw;
  }

  static double height(double value) {
    return value.h;
  }

  static double width(double value) {
    return value.w;
  }
  static const double lightTextSize = 10.0;
 
  static const double mediumTextSize = 14.0;
  static const double largeTextSize = 16.0;
  static const double heavyTextSize = 18.0;
  static double heavy18pxTextSize = 18.0;
  static const double const20pxTextSize = 25.0;
  static const double const21pxTextSize = 21.0;
   static const double const25pxTextSize = 30.0;
  static const double const12pxTextSize = 12.0;

}


