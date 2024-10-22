import 'package:flutter/material.dart';

import '../utility/styles.dart';

class CustomFilledButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final double width;
  final double height;
  final double radius;
  final Color color;
  final Color? textColor;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomFilledButton({
    super.key,
    required this.title,
    this.onPressed,
    this.width = 330,
    this.height = 50,
    this.radius = 8,
    this.textColor,
    this.fontSize = 20,
    this.fontWeight = FontWeight.bold,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Ink(
        decoration: BoxDecoration(
          gradient: Styles.customLinerGradient(context),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          onPressed: onPressed,
          child: Center(
            child: Text(
              title,
              style: Styles.style20(context).copyWith(
                color: textColor ?? Theme.of(context).colorScheme.onSurface,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
