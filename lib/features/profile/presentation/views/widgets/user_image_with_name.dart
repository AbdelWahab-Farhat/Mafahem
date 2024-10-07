import 'dart:developer';

import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/core/widgets/custom_loading_widget.dart';
import 'package:Basera/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UserImageWithName extends StatelessWidget {
  const UserImageWithName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var tokenCubit = context.read<TokenCubit>();
    log(tokenCubit.user!.data!.profilePhotoUrl.toString());

    return Column(
      children: [
        CircleAvatar(
          radius: 37.5,
          backgroundColor: Colors.grey.shade200,
          child: ClipOval(
            child: SvgPicture.network(
              tokenCubit.user!.data!.profilePhotoUrl!,
              placeholderBuilder: (context) => const CustomLoadingWidget(),
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
              semanticsLabel: 'Profile image of ${tokenCubit.user!.data!.name}', // Accessibility
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          tokenCubit.user!.data!.name ?? "User",
          style: Styles.style20(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontFamily: GoogleFonts.changa().fontFamily,
          ),
        ),
      ],
    );
  }
}
