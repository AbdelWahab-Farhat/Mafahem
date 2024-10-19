import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/core/utility/styles.dart';
import 'package:Mafaheem/features/profile/presentation/manager/toggle_profile_views_cubit/toggle_profile_views_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ToggleProfileViews extends StatelessWidget {
  const ToggleProfileViews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var toggleCubit = context.read<ToggleProfileViewsCubit>();

    return BlocBuilder<ToggleProfileViewsCubit, ToggleProfileViewsState>(
      builder: (context, state) => ToggleSwitch(
        minWidth: SizeConfig.screenWidth,
        initialLabelIndex: toggleCubit.activeIndex,
        dividerColor: Theme.of(context).colorScheme.onSurface,
        customTextStyles: [
          toggleCubit.activeIndex == 0
              ? Styles.style14(context).copyWith(color: Theme.of(context).colorScheme.onPrimary)
              : Styles.style14(context),
          toggleCubit.activeIndex == 1
              ? Styles.style14(context).copyWith(color: Theme.of(context).colorScheme.onPrimary)
              : Styles.style14(context),
          toggleCubit.activeIndex == 2
              ? Styles.style14(context).copyWith(color: Theme.of(context).colorScheme.onPrimary)
              : Styles.style14(context),
        ],
        inactiveBgColor: Theme.of(context).colorScheme.surface,
        animate: true,
        animationDuration: 450,
        totalSwitches: 3,
        labels: const ['كورسات مكتملة', 'مساراتي العلمية', 'شهاداتي'],
        radiusStyle: true,
        activeBgColor: [Theme.of(context).colorScheme.primary],
        onToggle: (index) {
          toggleCubit.onToggle(index!);
        },
      ),
    );
  }
}