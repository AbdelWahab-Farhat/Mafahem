import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/core/widgets/custom_app_bar.dart';
import 'package:Mafaheem/core/widgets/custom_divider.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:Mafaheem/features/home/presentation/views/widgets/section_title.dart';
import 'package:Mafaheem/features/setting/presentation/manager/Theme_cubit/theme_cubit.dart';
import 'package:Mafaheem/features/setting/presentation/views/widgets/setting_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Mafaheem/features/setting/presentation/views/widgets/edit_account_section.dart';
import 'package:Mafaheem/features/setting/presentation/views/widgets/more_section.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TokenCubit>();
    var themeCubit = context.read<ThemeCubit>();

    return Scaffold(
      appBar: const CustomAppBar(title: 'الأعدادات'),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: SizeConfig.screenHeight - (SizeConfig.screenHeight * 0.1),
          ),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                SvgPicture.asset('lib/assets/icons/logo.svg', height: 80),
                const Spacer(), // Properly uses available space
                Container(
                  width: SizeConfig.screenWidth,
                  decoration: containerStyle(context),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SettingHeader(cubit: cubit),
                        const SizedBox(height: 16),
                        const CustomDivider(),
                        const SizedBox(height: 14),
                        const SectionTitle(title: 'اعدادات الحساب'),
                        EditAccountSection(themeCubit: themeCubit),
                        const CustomDivider(),
                        const SizedBox(height: 16),
                        const SectionTitle(title: 'المزيد'),
                        const MoreSection(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration containerStyle(BuildContext context) {
    return BoxDecoration(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(32),
        topLeft: Radius.circular(32),
      ),
      color: Theme.of(context).colorScheme.surface,
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
          blurRadius: 1,
          offset: const Offset(0, 0),
        ),
      ],
    );
  }
}
