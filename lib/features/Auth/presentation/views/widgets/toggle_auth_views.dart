import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';


class ToggleAuthViews extends StatelessWidget {
  final String content;
  final String linkContent;
  final void Function()? onTap;
  const ToggleAuthViews({
    super.key,
    required this.content,
    required this.linkContent,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          content,
          style: Styles.style14(context),
        ),
        const SizedBox(
          width: 6,
        ),
        GestureDetector(
            onTap: onTap,
            child: Text(
              linkContent,
              style: Styles.style14(context)
                  .copyWith(decoration: TextDecoration.underline,fontWeight: FontWeight.w600),
            )),
      ],
    );
  }
}
