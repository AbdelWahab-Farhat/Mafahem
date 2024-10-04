import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String message, {int durationInSeconds = 2}) {
  // Create an overlay entry
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 50, // Adjust the top position
      left: 20,
      right: 20,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSurface,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            message,
            style: Styles.style16(context).copyWith(color: Theme.of(context).colorScheme.onPrimary),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );

  // Insert the overlay entry into the overlay
  Overlay.of(context).insert(overlayEntry);

  // Remove the overlay entry after the specified duration
  Future.delayed(Duration(seconds: durationInSeconds), () {
    overlayEntry.remove();
  });
}
