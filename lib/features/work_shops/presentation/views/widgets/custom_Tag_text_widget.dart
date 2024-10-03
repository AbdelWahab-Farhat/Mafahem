import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';

class CustomTagTextWidget extends StatelessWidget {
  final String text;

  const CustomTagTextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 10, vertical: 5), // مساحة داخلية
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1.5), // إطار خارجي
        borderRadius: BorderRadius.circular(16), // تدوير الحواف
      ),
      child: Text(
        text,
        style: Styles.style14(context)
            .copyWith(color: Theme.of(context).colorScheme.surface),
      ),
    );
  }
}
