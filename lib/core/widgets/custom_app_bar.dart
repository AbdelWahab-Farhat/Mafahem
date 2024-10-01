import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      title: Text(
        title,
        style: Styles.style24(context),
      ),
      centerTitle: true,
      leading: Row(
        children: [
          const SizedBox(width: 5,),
          IconButton(
            highlightColor: Theme.of(context).colorScheme.surface.withOpacity(0.1),
            splashColor: Theme.of(context).colorScheme.surface.withOpacity(0.1),
            style: ButtonStyle(
              backgroundColor:WidgetStateProperty.all(Theme.of(context).colorScheme.onSurface),
            ),
            iconSize: 20,
            icon: SvgPicture.asset(
              'lib/assets/icons/back-arrow.svg',
              fit: BoxFit.scaleDown,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>  Size(SizeConfig.screenWidth, kToolbarHeight);
}