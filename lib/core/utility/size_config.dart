

import 'package:flutter/cupertino.dart';

abstract class SizeConfig {
  static double screenWidth = 0;
  static double screenHeight = 0;


  static init(BuildContext context) {
    screenWidth = MediaQuery.sizeOf(context).width;
    screenHeight = MediaQuery.sizeOf(context).height;
  }
}