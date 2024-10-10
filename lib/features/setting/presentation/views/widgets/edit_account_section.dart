import 'package:Basera/core/utility/functions/navigate_functions.dart';
import 'package:Basera/core/utility/functions/ui_functions.dart';
import 'package:Basera/features/Auth/presentation/views/login_view.dart';
import 'package:Basera/features/setting/data/log_out_service.dart';
import 'package:Basera/features/setting/presentation/manager/Theme_cubit/theme_cubit.dart';
import 'package:Basera/features/setting/presentation/views/widgets/setting_view_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class EditAccountSection extends StatelessWidget {
  const EditAccountSection({
    super.key,
    required this.themeCubit,
  });

  final ThemeCubit themeCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingListTile(
          title: 'تعديل الحساب',
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).colorScheme.onSurface,
            size: 16,
          ),
        ),
        SettingListTile(
          title: 'النمط المظلم',
          trailing: CupertinoSwitch(
              applyTheme: true,
              value: themeCubit.isDark,
              onChanged: themeCubit.onThemeChange),
        ),
        SettingListTile(
          title: 'تفعيل الاشعارات',
          trailing: CupertinoSwitch(
            applyTheme: true,
            value: false,
            onChanged: (value) {},
          ),
        ),
        SettingListTile(
          title: 'تسجيل الخروج',
          onTap: () async {
            showLogoutBottomSheet(
              context, () async {
              var isLoggedOut = await LogOutService.logOutUser();
              if (isLoggedOut) {
                pushAndRemoveUntil(context, const LoginView());
              }
            },
                  () => pop(context),
            );
          },
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).colorScheme.onSurface,
            size: 16,
          ),
        ),
      ],
    );
  }
}
