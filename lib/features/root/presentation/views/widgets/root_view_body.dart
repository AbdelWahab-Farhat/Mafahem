import 'package:Basera/features/root/presentation/manager/navigate_cubit/navigate_cubit.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootViewBody extends StatelessWidget {
  const RootViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var navigateCubit = context.read<NavigateCubit>();
    return BlocBuilder<NavigateCubit, NavigateState>(
      builder: (context, state) {
        return Scaffold(
          body: navigateCubit.views[navigateCubit.currentIndex],
          bottomNavigationBar: AnimatedNotchBottomBar(
            color: Theme.of(context).colorScheme.onPrimary,
            showLabel: false,
            notchBottomBarController: navigateCubit.notchBottomBarController,
            bottomBarItems: navigateCubit.items(context),
            onTap: navigateCubit.navigateTo,
            textAlign: TextAlign.center,
            kIconSize: 23.0,
            shadowElevation: 0.8,
            kBottomRadius: 30.0,
          ),
        );
      },
    );
  }
}
