import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/widgets/custom_app_bar.dart';
import 'package:Basera/core/widgets/custom_divider.dart';
import 'package:Basera/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:Basera/features/home/presentation/views/widgets/section_title.dart';
import 'package:Basera/features/setting/presentation/manager/Theme_cubit/theme_cubit.dart';
import 'package:Basera/features/setting/presentation/views/widgets/setting_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Basera/features/setting/presentation/views/widgets/edit_account_section.dart';
import 'package:Basera/features/setting/presentation/views/widgets/more_section.dart';


class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TokenCubit>();
    var themeCubit = context.read<ThemeCubit>();
    return Scaffold(
      appBar: const CustomAppBar(title: 'الأعدادات'),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight * 0.75,
          decoration: containerStyle(context),
          child: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SettingHeader(cubit: cubit),
                    const SizedBox(
                      height: 16,
                    ),
                    const CustomDivider(),
                    const SizedBox(
                      height: 14,
                    ),
                    const SectionTitle(
                      title: 'اعدادات الحساب',
                    ),
                    EditAccountSection(themeCubit: themeCubit),
                    const CustomDivider(),
                    const SizedBox(height: 16,),
                    const SectionTitle(title: 'المزيد'),
                    const MoreSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration containerStyle(BuildContext context) {
    return BoxDecoration(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(32), topLeft: Radius.circular(32)),
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
            blurRadius: 1,
            offset: const Offset(0, 0),
          )
        ]);
  }
}





