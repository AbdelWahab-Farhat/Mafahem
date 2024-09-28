import 'package:flutter/material.dart';

import '../utility/styles.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final Widget? icon;
  const CustomTextField({
    super.key,
    this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: Styles.style14(context),
          ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          keyboardType:
          icon == null ? TextInputType.text : TextInputType.number,
          obscureText: icon == null ? false : true,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            enabledBorder: Styles.setOutlinedBorder(context),
            errorBorder: Styles.setOutlinedBorder(context , isErrorBorder:  true),
            focusedErrorBorder: Styles.setOutlinedBorder(context ,width: 2 ,isErrorBorder: true),
            focusedBorder: Styles.setOutlinedBorder(context ,width: 2),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(14.0),
              child: icon,
            ),
          ),
        ),
      ],
    );
  }
}

