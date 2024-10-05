import 'package:flutter/material.dart';
import '../utility/styles.dart';

class CustomIconButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final double width;
  final double height;
  final double radius;
  final Color color;
  final Color? textColor;
  final Widget? icon;
  final FontWeight fontWeight;
  const CustomIconButton({
    super.key,
    required this.title,
    this.onPressed,
    this.width = 330,
    this.height = 50,
    this.radius = 8,
    this.color = Colors.white,
    this.icon,
    this.textColor,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(color),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: Styles.style14(context)
                  .copyWith(color: textColor, fontWeight: fontWeight),
            ),
            const SizedBox(
              width: 10,
            ),
            if (icon != null) Center(child: icon!),
          ],
        ),
      ),
    );
  }
}
