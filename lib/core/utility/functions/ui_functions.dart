import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/core/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

void showCustomSnackBar(BuildContext context, String message,
    {int durationInSeconds = 2}) {
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
            style: Styles.style16(context)
                .copyWith(color: Theme.of(context).colorScheme.onPrimary),
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

void showCustomDialog({
  required BuildContext context,
  required String title,
  required String description,
  required String image,
  void Function()? onConfirm,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return _AnimatedDialog(
        title: title,
        description: description,
        image: image,
        onConfirm: onConfirm,
      );
    },
  );
}

class _AnimatedDialog extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  final void Function()? onConfirm;

  const _AnimatedDialog({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    this.onConfirm,
  });

  @override
  State<_AnimatedDialog> createState() => _AnimatedDialogState();
}

class _AnimatedDialogState extends State<_AnimatedDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward(); // Start the animation when the dialog opens
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        contentPadding: const EdgeInsets.all(16.0),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Lottie.asset(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              widget.title,
              style: Styles.style18(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.description,
              style: Styles.style16(context),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          CustomFilledButton(
            title: 'اغلاق',
            color: Theme.of(context).colorScheme.primary,
            textColor: Theme.of(context).colorScheme.onPrimary,
            onPressed: widget.onConfirm,
          ),
        ],
      ),
    );
  }
}

void showLogoutBottomSheet(BuildContext context ,void Function()? onConfirm , void Function()? onCancel) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: SizeConfig.screenHeight * 0.25,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min, // Minimize the height
            children: [
              Text(
                'تسجيل خروج',
                style: Styles.style18(context)
                    .copyWith(fontFamily: GoogleFonts.changa().fontFamily),
              ),
              const SizedBox(height: 10),
              Text('هل أنت متأكد من رغبتك في تسجيل الخروج؟',
                  textAlign: TextAlign.center, style: Styles.style16(context)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomFilledButton(
                    title: 'خروج',
                    color: Theme.of(context).colorScheme.primary,
                    width: SizeConfig.screenWidth * 0.35,
                    height: 45,
                    radius: 32,
                    fontSize: 14,
                    textColor: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                    onPressed: onConfirm,
                  ),
                  const SizedBox(width: 10,),
                  CustomFilledButton(
                    title: 'الغاء',
                    color: Theme.of(context).colorScheme.surface,
                    width: SizeConfig.screenWidth * 0.35,
                    height: 45,
                    radius: 32,
                    fontSize: 14,
                    textColor: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                    onPressed: onCancel,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
