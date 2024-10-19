import 'package:Mafaheem/core/utility/styles.dart';
import 'package:flutter/material.dart';

class CustomActionChip extends StatelessWidget {
  // TODO: WILL CHANGE TO OBJECT LATER
  final String label;
  final void Function()? onPressed;
  const CustomActionChip({
    super.key, required this.label, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,),
      child: ActionChip(
        onPressed: onPressed,
        label:  Text(
          label,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
            side: BorderSide(color: Theme.of(context).colorScheme.onSurface)
        ),
        labelStyle: Styles.style14(context)
            .copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
    );
  }
}
