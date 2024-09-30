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
    this.color = Colors.blue,
    this.textColor,
    this.fontSize = 20,
    this.fontWeight = FontWeight.bold
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(color),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              title,
              style: Styles.style20(context).copyWith(color:textColor ?? Theme.of(context).colorScheme.onSurface,fontSize: fontSize,fontWeight: fontWeight),
            ),
          )),
    );
  }
}
