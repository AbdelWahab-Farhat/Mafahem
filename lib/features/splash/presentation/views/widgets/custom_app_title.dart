import 'package:flutter/material.dart';

import '../../../../../constant.dart';

class CustomAppTitle extends StatelessWidget {
  const CustomAppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      const TextSpan(
        text: 'عَ',
        style: TextStyle(
          fontFamily: kFontFamily,
            fontSize: 62, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      TextSpan(
        text: 'طَـا',
        style: TextStyle(
            fontFamily: kFontFamily,
            fontSize: 62, fontWeight: FontWeight.bold, color: kPrimary),
      ),
       const TextSpan(
        text: 'ءٌ',
        style: TextStyle(
          fontFamily: kFontFamily,
            fontSize: 62, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    ]));
  }
}
