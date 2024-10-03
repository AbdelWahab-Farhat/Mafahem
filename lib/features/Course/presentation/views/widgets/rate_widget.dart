import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';
class RateWidget extends StatelessWidget {
  const RateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('4.3',style: Styles.style16(context),),
        const SizedBox(width: 5,),
        const Icon(Icons.star ,color: Colors.orange,)
      ],
    );
  }
}

