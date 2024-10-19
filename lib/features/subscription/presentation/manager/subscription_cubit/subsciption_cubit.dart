import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/core/widgets/custom_filled_button.dart';
import 'package:Mafaheem/features/subscription/presentation/views/widgets/subPriceCard.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'subsciption_state.dart';

class SubscriptionCubit extends Cubit<SubscriptionState> {
  final PageController pageController = PageController();
  bool yearlyPlan = false;
  bool monthlyPlan = true;
  SubscriptionCubit() : super(SubscriptionInitial());

  animateToPage(
      {required int index,
      Duration duration = const Duration(milliseconds: 300),
      Curve curve = Curves.easeIn}) {
    pageController.animateToPage(index, duration: duration, curve: curve);
  }

  // Monthly 0  , Yearly 1
  pickPlan(int planNumber) {
    if (planNumber == 0) {
      monthlyPlan = true;
      yearlyPlan = false;
    }
    if (planNumber == 1) {
      yearlyPlan = true;
      monthlyPlan = false;
    }
    emit(SubscriptionInitial());
  }

  void subscriptionBottomSheet(BuildContext context, void Function()? onConfirm,) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: this,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: SizeConfig.screenHeight * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  BlocBuilder<SubscriptionCubit, SubscriptionState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => pickPlan(1),
                            child: SubPriceCard(
                              planType: 'سنوي',
                              price: '980د.ل',
                              pricePerMonth: '80',
                              planName: 'العام',
                              isSelected: yearlyPlan,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () => pickPlan(0),
                            child: SubPriceCard(
                              planType: 'شهري',
                              price: '100',
                              planName: 'الشهر',
                              isSelected: monthlyPlan,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFilledButton(
                    title: 'أدفع',
                    width: SizeConfig.screenWidth * 0.80,
                    height: 60,
                    radius: 16,
                    fontSize: 20,
                    textColor: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                    onPressed: () {
                      if (yearlyPlan) {
                        onConfirm!();
                      } else {
                        onConfirm!();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
