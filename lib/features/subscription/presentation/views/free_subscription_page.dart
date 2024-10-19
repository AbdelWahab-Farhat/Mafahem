import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/core/utility/styles.dart';
import 'package:Mafaheem/core/widgets/custom_filled_button.dart';
import 'package:Mafaheem/features/subscription/presentation/manager/subscription_cubit/subsciption_cubit.dart';
import 'package:Mafaheem/features/subscription/presentation/views/widgets/subscription_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FreeSubscriptionPage extends StatelessWidget {
  const FreeSubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    var subCubit = context.read<SubscriptionCubit>();
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const CurrentSubscription(
            title: 'الخطة المجانية',
          ),
          Image.asset(
            'lib/assets/images/Subscriptions-bro.png',
            width: SizeConfig.screenWidth * 0.8,
            height: SizeConfig.screenHeight * 0.3,
          ),
          Text(
            'المميزات :',
            style: Styles.style20(context).copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface),
          ),
          const SubPoint(title: 'متابعة تقدم الكورسات المجانية'),
          const SubPoint(title: 'الحصول على عروض ترويجية للكورسات المدفوعة'),
          const SubPoint(title: 'إشعارات بالكورسات الجديدة والمحتوى المجاني'),
          const SubPoint(title: 'إمكانية حضور ورش العمل المجانية'),
          const SizedBox(
            height: 10,
          ),
          CustomFilledButton(title: 'اذهب للخطة المميزة',
              textColor: Theme.of(context).colorScheme.onPrimary,
              onPressed: () {
                subCubit.animateToPage(index: 1);
              },
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
