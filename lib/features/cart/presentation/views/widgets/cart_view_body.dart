import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/widgets/custom_app_bar.dart';
import 'package:Basera/core/widgets/custom_filled_button.dart';
import 'package:Basera/features/cart/presentation/manager/scroll_cubit/scroll_cubit.dart';
import 'package:Basera/features/cart/presentation/views/widgets/bill_section.dart';
import 'package:Basera/features/cart/presentation/views/widgets/cart_item_widget.dart';
import 'package:Basera/features/cart/presentation/views/widgets/custom_discount_text_field.dart';
import 'package:Basera/features/cart/presentation/views/widgets/custom_scroll_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var scrollCubit = context.read<ScrollCubit>();


    return Scaffold(
      floatingActionButton: CustomScrollButton(scrollCubit: scrollCubit),
      appBar: const CustomAppBar(
        title: 'السلة',
      ),
      body: SingleChildScrollView(
        controller: scrollCubit.scrollController,
        child: Column(
          children: [
            SizedBox(
              width: SizeConfig.screenWidth,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const CartItemWidget();
                },
              ),
            ),
            const SizedBox(height: 32),
            CustomDiscountTextField(
                hintText: 'اضافة كود خصم',
                icon: Icons.sell_outlined,
                controller: TextEditingController()),
            const SizedBox(height: 32),
            const BillSection(),
            const SizedBox(height: 32),
            CustomFilledButton(
              title: 'تأكيد الطلب',
              onPressed: () {},
              height: 60,
              color: Theme.of(context).colorScheme.onSurface,
              textColor: Theme.of(context).colorScheme.surface,
              radius: 32,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}


