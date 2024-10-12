import 'package:flutter/material.dart';

import '../utility/styles.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final double width;
  final double height;
  final double radius;
  final Color borderColor;
  final Color? textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderWidth;

  const CustomOutlinedButton({
    super.key,
    required this.title,
    this.onPressed,
    this.width = 330,
    this.height = 50,
    this.radius = 8,
    this.borderColor = Colors.blue, // Border color for outlined button
    this.textColor,
    this.fontSize = 20,
    this.fontWeight = FontWeight.bold,
    this.borderWidth = 2.0, // Thickness of the outline
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: borderColor, width: borderWidth), // Outline border
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          onPressed: onPressed,
          child: Center(
            child: Text(
              title,
              style: Styles.style20(context).copyWith(
                color: textColor ?? borderColor, // Use border color for text if textColor is not provided
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
