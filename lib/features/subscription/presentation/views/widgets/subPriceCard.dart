import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';

class SubPriceCard extends StatelessWidget {
  final String planName;
  final String planType;
  final String price;
  final String? pricePerMonth;
  final bool isSelected;
  const SubPriceCard({
    super.key,
    required this.planType,
    required this.price,
    this.pricePerMonth,
    this.isSelected = false, required this.planName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.4,
      height: SizeConfig.screenHeight * 0.16,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(color: isSelected ?  Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurface, width:isSelected ?  3.0  : 2.0),
        borderRadius: BorderRadius.circular(16.0),
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            planType,
            style: Styles.style16(context).copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5.0),
          RichText(
            text: TextSpan(
              style: Styles.style20(context).copyWith(color: Theme.of(context).colorScheme.primary),
              children: [
                TextSpan(text: price),
                 TextSpan(
                  text: ' / $planName',
                  style:Styles.style16(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5.0),
          if (pricePerMonth != null)
            Text(
              '( $pricePerMonth / الشهر )',
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
        ],
      ),
    );
  }
}
