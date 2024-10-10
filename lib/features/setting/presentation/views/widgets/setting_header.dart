import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/core/widgets/custom_avatar_widget.dart';
import 'package:Basera/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingHeader extends StatelessWidget {
  const SettingHeader({
    super.key,
    required this.cubit,
  });

  final TokenCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomAvatarWidget(
          radius: 20,
          hasShadow: true,
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          cubit.user!.data.name ?? "",
          style: Styles.style16(context).copyWith(
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.changa().fontFamily,
          ),
        ),
      ],
    );
  }
}
