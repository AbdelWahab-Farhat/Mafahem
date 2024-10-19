import 'package:Mafaheem/core/utility/functions/navigate_functions.dart';
import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/core/utility/styles.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:Mafaheem/features/cart/presentation/views/cart_view.dart';
import 'package:Mafaheem/features/notification/presentation/views/notification_view.dart';
import 'package:Mafaheem/features/profile/presentation/views/profile_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var tokenCubit = context.read<TokenCubit>();
    return AppBar(
      shadowColor: Colors.black,
      backgroundColor: Theme.of(context).colorScheme.surface,
      leading: GestureDetector(
        onTap: () => push(context, const ProfileView()),
        child: Container(
            margin: const EdgeInsets.only(right: 15),
            width: 40,
            height: 40,
            child: CachedNetworkImage(
                imageUrl: tokenCubit.user!.data.profilePhotoUrl,
              placeholder: (context, url) => Image.asset('lib/assets/images/Avatar.png'),
              errorWidget: (context, url, error) => Image.asset('lib/assets/images/Avatar.png'),
            )),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tokenCubit.user?.data?.name ?? "User",
            style: Styles.style16(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.changa().fontFamily),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "يوم جديد علم جديد",
            style: Styles.style14(context)
                .copyWith(fontFamily: GoogleFonts.changa().fontFamily),
          )
        ],
      ),
      actions: [
        IconButton(
            onPressed: () => push(context, const NotificationView()),
            icon: SvgPicture.asset(
              'lib/assets/icons/notification.svg',
              height: 25,
              width: 25,
              color: Theme.of(context).colorScheme.onSurface,
            )),
        IconButton(
            onPressed: () => push(context, const CartView()),
            icon: SvgPicture.asset(
              'lib/assets/icons/cart.svg',
              height: 25,
              width: 25,
              color: Theme.of(context).colorScheme.onSurface,
            )),
      ],
      shape: LinearBorder(
          side: BorderSide(
              width: 0.2, color: Theme.of(context).colorScheme.onSurface),
          bottom: const LinearBorderEdge()),
    );
  }

  @override
  Size get preferredSize => Size(SizeConfig.screenWidth, kToolbarHeight);
}
