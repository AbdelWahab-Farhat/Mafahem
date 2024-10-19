import 'package:Mafaheem/core/widgets/custom_filled_button.dart';
import 'package:Mafaheem/features/on_boarding/presentation/manager/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {

  @override
  void initState() {
    super.initState();
    context.read<OnboardingCubit>().changeTitleDependsOnPage();
  }


  @override
  Widget build(BuildContext context) {
    var onBoardingCubit = context.read<OnboardingCubit>();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: onBoardingCubit.controller,
              children:onBoardingCubit.items
            ),
          ),
          SmoothPageIndicator(
            controller: onBoardingCubit.controller,
            count: onBoardingCubit.count,
            effect: WormEffect(
                activeDotColor: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(
            height: 64,
          ),
          BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              return CustomFilledButton(
                color: Theme.of(context).colorScheme.primary,
                textColor: Theme.of(context).colorScheme.onPrimary,
                title: onBoardingCubit.buttonTitle,
                onPressed: () {
                  onBoardingCubit.navigateTo(context);
                },
              );
            },
          ),
          const SizedBox(
            height: 64,
          ),
        ],
      ),
    );
  }
}
