import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/utility/styles.dart';
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
      backgroundColor: Colors.white,
      leading:
      Container(
        margin: const EdgeInsets.only(right: 15),
        width: 40,
        height: 40,
        child: Image.asset('lib/assets/images/Avatar.png',),
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
          const SizedBox(height: 4,),
          Text("يوم جديد علم جديد",style: Styles.style14(context).copyWith(fontFamily: GoogleFonts.changa().fontFamily),)
        ],
      ),
      actions: [
        IconButton(onPressed: (){}, icon: SvgPicture.asset('lib/assets/icons/bell.svg'),),
        IconButton(onPressed: (){}, icon: SvgPicture.asset('lib/assets/icons/setting.svg')),
      ],
    );
  }

  @override
  Size get preferredSize => Size( SizeConfig.screenWidth, kToolbarHeight);
}
