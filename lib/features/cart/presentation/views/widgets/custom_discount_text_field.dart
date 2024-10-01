import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';

class CustomDiscountTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;

  const CustomDiscountTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 0.2,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Styles.style14(context).copyWith(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.5)),
          prefixIcon: Icon(icon),
          suffixIcon: TextButton(
              onPressed: () {},
              child: Text(
                'اضافة',
                style: Styles.style14(context)
                    .copyWith(fontWeight: FontWeight.bold),
              )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
            borderSide: BorderSide.none,
          ),
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        ),
      ),
    );
  }
}
