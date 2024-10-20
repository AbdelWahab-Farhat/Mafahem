import 'dart:developer';
import 'package:Mafaheem/core/utility/styles.dart';
import 'package:Mafaheem/core/widgets/custom_avatar_widget.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class UserImageWithName extends StatelessWidget {
  const UserImageWithName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var tokenCubit = context.read<TokenCubit>();
    log(tokenCubit.user!.profilePhotoUrl.toString());

    return Column(
      children: [
        const CustomAvatarWidget(),
        const SizedBox(
          height: 8,
        ),
        Text(
          tokenCubit.user!.name ?? "User",
          style: Styles.style20(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontFamily: GoogleFonts.changa().fontFamily,
          ),
        ),
      ],
    );
  }
}

