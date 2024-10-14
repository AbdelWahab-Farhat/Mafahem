import 'package:flutter/material.dart';

import '../utility/styles.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final Widget? icon;
  //TODO: CHANGE EACH PASSWORD TO OBSCURE LATER
  final bool isObscureText;
  final int maxLines;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  const CustomTextField({
    super.key,
    this.label,
    this.icon,
    this.validator,
    this.onSaved,
    this.controller,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style:
                Styles.style14(context).copyWith(fontWeight: FontWeight.bold),
          ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          onSaved: onSaved,
          maxLines: maxLines,
          style: Styles.style14(context),
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          keyboardType: keyboardType,
          obscureText: isObscureText,
          decoration: InputDecoration(
            errorStyle: Styles.style12(context)
                .copyWith(color: Theme.of(context).colorScheme.error),
            fillColor: Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),
            filled: true,
            enabledBorder: Styles.setOutlinedBorder(context),
            errorBorder: Styles.setOutlinedBorder(context, isErrorBorder: true),
            focusedErrorBorder: Styles.setOutlinedBorder(
              context,
              width: 2,
              isErrorBorder: true,
            ),
            focusedBorder: Styles.setOutlinedBorder(context, width: 2),
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
