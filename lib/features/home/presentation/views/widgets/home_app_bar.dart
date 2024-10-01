import 'package:Basera/core/utility/helper.dart';
import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/features/cart/presentation/views/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.black,
      backgroundColor: Theme.of(context).colorScheme.surface,
      leading: Container(
        margin: const EdgeInsets.only(right: 15),
        width: 40,
        height: 40,
        child: Image.asset(
          'lib/assets/images/Avatar.png',
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "محمد عزيز",
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
            onPressed: () {}, icon: SvgPicture.asset('lib/assets/icons/notification.svg',height: 25,width: 25,color: Theme.of(context).colorScheme.onSurface,)),
        IconButton(
            onPressed: () => push(context, const CartView()), icon: SvgPicture.asset('lib/assets/icons/cart.svg',height: 25,width: 25,color: Theme.of(context).colorScheme.onSurface,)),
      ],
      shape:  LinearBorder(side:  BorderSide(width: 0.2,color: Theme.of(context).colorScheme.onSurface),bottom: LinearBorderEdge()),
    );
  }
  @override
  Size get preferredSize => Size(SizeConfig.screenWidth, kToolbarHeight);
}
