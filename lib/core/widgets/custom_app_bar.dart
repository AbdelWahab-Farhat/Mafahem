import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';

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
            highlightColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
            splashColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
            style: const ButtonStyle(),
            iconSize: 25,
            icon: Icon(Icons.arrow_back_ios_new, color: Theme.of(context).colorScheme.secondary,),
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