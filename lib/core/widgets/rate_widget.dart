import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';

class RateWidget extends StatelessWidget {
  final double textSize;
  final double rate;
  final Widget icon;
  const RateWidget({
    super.key,
    this.textSize = 16,
    this.rate = 4.5,
    this.icon = const Icon(Icons.star),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          rate.toString(),
          style: Styles.style16(context).copyWith(fontSize: textSize),
        ),
        const SizedBox(
          width: 5,
        ),
        icon
      ],
    );
  }
}
