import 'package:Basera/core/utility/functions/navigate_functions.dart';
import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/features/setting/presentation/views/setting_view.dart';
import 'package:flutter/material.dart';


class ProfileAppBar extends StatelessWidget  implements PreferredSizeWidget{
  const ProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon :  Icon(
                Icons.arrow_back_ios_new,
                size: 25,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Text(
                'الملف الشخصي',
                style: Styles.style24(context)
            ),
            IconButton(
              icon: const Icon(
                Icons.settings,
                size: 25,
              ),
              color: Theme.of(context).colorScheme.onSurface,
              onPressed: ()=> push(context, const SettingView()),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>  Size(SizeConfig.screenWidth, kToolbarHeight);
}
