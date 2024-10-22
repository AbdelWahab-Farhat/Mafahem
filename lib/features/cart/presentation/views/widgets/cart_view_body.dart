import 'package:Mafaheem/core/utility/functions/navigate_functions.dart';
import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/core/widgets/custom_app_bar.dart';
import 'package:Mafaheem/core/widgets/custom_card_list_view_shimmer.dart';
import 'package:Mafaheem/core/widgets/custom_empty_state_widget.dart';
import 'package:Mafaheem/core/widgets/custom_filled_button.dart';
import 'package:Mafaheem/features/cart/data/bill_service.dart';
import 'package:Mafaheem/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:Mafaheem/features/cart/presentation/manager/coupon_cubit/coupon_cubit.dart';
import 'package:Mafaheem/features/cart/presentation/manager/scroll_cubit/scroll_cubit.dart';
import 'package:Mafaheem/features/cart/presentation/views/widgets/bill_section.dart';
import 'package:Mafaheem/features/cart/presentation/views/widgets/cart_list_view.dart';
import 'package:Mafaheem/features/cart/presentation/views/widgets/custom_discount_text_field.dart';
import 'package:Mafaheem/features/cart/presentation/views/widgets/custom_scroll_button.dart';
import 'package:Mafaheem/features/payment/data/payment_item_type.dart';
import 'package:Mafaheem/features/payment/presentation/views/payment_view_sheet.dart';
import 'package:Mafaheem/features/root/presentation/views/root_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  void initState() {
    context.read<CartCubit>().getUserCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var scrollCubit = context.read<ScrollCubit>();
    var couponCubit = context.read<CouponCubit>();

    return Scaffold(
      floatingActionButton: CustomScrollButton(scrollCubit: scrollCubit),
      appBar: const CustomAppBar(
        title: 'السلة',
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            // إذا كانت البيانات قيد التحميل، عرض تأثير التحميل (shimmer).
            return const CustomCardListViewShimmer();
          } else if (state is CartFailure) {
            if (state.errMessage.contains('Empty')) {
              return CustomEmptyStateWidget(
                title: state.errMessage,
                subTitle: 'أحصل على كورسات الان !',
                button: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CustomFilledButton(
                    title: 'تسوق',
                    textColor: Theme.of(context).colorScheme.onPrimary,
                    onPressed: () => pushReplacement(context, const RootView()),
                  ),
                ),
                image: Image.asset(
                  'lib/assets/images/empty-basket.png',
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight * 0.25,
                ),
              );
            }
            return CustomEmptyStateWidget(
              title: state.errMessage,
              subTitle: 'قم بأعادة تحميل الصفحة',
              image: Image.asset(
                'lib/assets/images/Box.png',
                width: SizeConfig.screenWidth,
              ),
            );
          } else if (state is CartSuccess) {
            // إذا تم تحميل البيانات بنجاح، عرض العربة.
            var cart = context.read<CartCubit>().cart;
            var courses = cart?.courses ?? [];

            return SingleChildScrollView(
              controller: scrollCubit.scrollController,
              child: Column(
                children: [
                  SizedBox(
                    width: SizeConfig.screenWidth,
                    height:
                        courses.isEmpty ? SizeConfig.screenHeight * 0.8 : null,
                    child: courses.isEmpty
                        ? CustomEmptyStateWidget(
                            title: 'السلة فارغة',
                            subTitle: 'قم بتعبئتها',
                            image: Image.asset(
                              'lib/assets/images/empty-basket.png',
                              width: SizeConfig.screenWidth * 0.4,
                              height: SizeConfig.screenHeight * 0.25,
                            ),
                            button: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: CustomFilledButton(
                                title: 'تسوق',
                                textColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                onPressed: () =>
                                    pushReplacement(context, const RootView()),
                              ),
                            ),
                          )
                        : const CartListView(),
                  ),
                  const SizedBox(height: 32),
                  if (courses.isNotEmpty) ...[
                    CustomDiscountTextField(
                      hintText: 'اضافة كود خصم',
                      icon: Icons.sell_outlined,
                      controller: couponCubit.couponCodeController,
                    ),
                    const SizedBox(height: 32),
                    const BillSection(),
                    const SizedBox(height: 32),
                    CustomFilledButton(
                      title: 'تأكيد الطلب',
                      onPressed: () {
                        showPaymentViewSheet(
                            context,
                            BillService.totalPrice(courses),
                            PaymentItemType.courses,
                            couponCubit.coupon,
                            null);
                      },
                      height: 60,
                      color: Theme.of(context).colorScheme.onSurface,
                      textColor: Theme.of(context).colorScheme.surface,
                      radius: 32,
                    ),
                    const SizedBox(height: 32),
                  ],
                ],
              ),
            );
          } else {
            return CustomEmptyStateWidget(
              title: 'لا توجد بيانات متاحة.',
              subTitle: ' يرجى المحاولة مرة أخرى',
              image: Image.asset(
                'lib/assets/images/empty-basket.png',
                width: SizeConfig.screenWidth * 0.4,
                height: SizeConfig.screenHeight * 0.25,
              ),
            );
          }
        },
      ),
    );
  }
}
