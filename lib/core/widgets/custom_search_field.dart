import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';


class CustomSearchField extends StatelessWidget {
  final String? hintText;
  final Widget? icon;
  final String tag = "search";
  const CustomSearchField({
    super.key,
    this.hintText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Hero(
        tag: tag,
        child: TextFormField(
          enabled: false,
          keyboardType:
          icon == null ? TextInputType.text : TextInputType.number,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            hintText: hintText,
            hintStyle: Styles.style14(context).copyWith(color: const Color(0xff4D616B)),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: Styles.setOutlinedBorder(context, radius: 16),
            disabledBorder: Styles.setOutlinedBorder(context, radius: 16),
            focusedBorder: Styles.setOutlinedBorder(context, width: 2),
            suffixIcon: Container(
              margin: const EdgeInsets.only(left: 10),
                child: icon),
            suffixIconConstraints: const BoxConstraints(
              minHeight: 40,
              minWidth: 40,
            ),
          ),
        ),
      ),
    );
  }
}