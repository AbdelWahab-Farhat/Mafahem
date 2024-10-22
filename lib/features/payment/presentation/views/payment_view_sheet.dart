import 'package:Mafaheem/core/models/coupon.dart';
import 'package:Mafaheem/core/models/road_map.dart';
import 'package:Mafaheem/core/utility/functions/navigate_functions.dart';
import 'package:Mafaheem/core/utility/functions/ui_functions.dart';
import 'package:Mafaheem/core/utility/styles.dart';
import 'package:Mafaheem/core/widgets/custom_filled_button.dart';
import 'package:Mafaheem/core/widgets/custom_loading_widget.dart';
import 'package:Mafaheem/features/payment/data/payment_item_type.dart';
import 'package:Mafaheem/features/payment/data/payment_method.dart';
import 'package:Mafaheem/features/payment/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:Mafaheem/features/root/presentation/views/root_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showPaymentViewSheet(BuildContext context, double totalPrice,
    PaymentItemType paymentItemType, Coupon? coupon, RoadMap? roadMap) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return BlocProvider(
        create: (context) => PaymentCubit(coupon,
            roadMap,
            totalPrice: totalPrice, paymentItemType: paymentItemType),
        child: const PaymentViewSheet(),
      );
    },
  );
}

class PaymentViewSheet extends StatelessWidget {
  const PaymentViewSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var paymentCubit = context.read<PaymentCubit>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'قم بأختيار طريقة الدفع',
            style:
                Styles.style18(context).copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          BlocConsumer<PaymentCubit, PaymentState>(
            listener: (context, state) {
              if (state is PaymentSuccess) {
                showCustomDialog(
                  context: context,
                  title: 'تمت عملية الدفع بنجاح',
                  description: 'شكرا لكونك زبون الى منصة مفاهيــم ',
                  image: 'lib/assets/animation/payment-done-animation.json',
                  onConfirm: () =>
                      pushAndRemoveUntil(context, const RootView()),
                );
              } else if (state is PaymentFailure) {
                showCustomSnackBar(context, state.errMessage);
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () => paymentCubit
                            .selectPaymentMethod(PaymentMethod.sadad),
                        child: Container(
                          width: 150,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: paymentCubit.paymentMethod ==
                                      PaymentMethod.sadad
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.onSurface,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'lib/assets/images/Sadad.almadar-removebg-preview.png',
                                // Replace with your image path
                                width: 50,
                                height: 50,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'ســداد',
                                style: Styles.style14(context)
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => paymentCubit
                            .selectPaymentMethod(PaymentMethod.adfali),
                        child: Container(
                          width: 150,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: paymentCubit.paymentMethod ==
                                      PaymentMethod.adfali
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.onSurface,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'lib/assets/images/adfali.png',
                                // Replace with your image path
                                width: 50,
                                height: 50,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'أدفـعلي',
                                style: Styles.style14(context)
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<PaymentCubit, PaymentState>(
                    builder: (context, state) {
                      if (state is PaymentLoading) {
                        return const CustomLoadingWidget();
                      }
                      return CustomFilledButton(
                        textColor: Theme.of(context).colorScheme.onPrimary,
                        title: 'قم بالدفـع',
                        height: 40,
                        onPressed: () {
                          paymentCubit.confirmPayment();
                        },
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
