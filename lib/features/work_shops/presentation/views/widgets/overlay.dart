import 'package:flutter/material.dart';

class OverlayLayerWidget extends StatelessWidget {
  const OverlayLayerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withOpacity(1),
              Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withOpacity(.40),
              Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withOpacity(.20),
              Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withOpacity(0),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}
