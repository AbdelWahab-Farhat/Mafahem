import 'package:Basera/core/utility/functions/ui_functions.dart';
import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/core/widgets/custom_filled_button.dart';
import 'package:Basera/features/subscription/presentation/manager/subscription_cubit/subsciption_cubit.dart';
import 'package:Basera/features/subscription/presentation/views/widgets/subscription_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PremiumSubscriptionPage extends StatelessWidget {
  const PremiumSubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    var subCubit = context.read<SubscriptionCubit>();
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const CurrentSubscription(
            title: 'الخطة المميزة',
            isFreePLan: false,
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
          const SubPoint(title: 'الوصول لأكثر من 20 كورس مجاني',),
          const SubPoint(title: 'عروض خاصة وتخفيضات على كورسات مطلوبة'),
          const SubPoint(title: 'اعلام مسبق بورش عمل غير متاحة'),
          const SubPoint(title: 'مدربيين خصوصيين'),
          CustomFilledButton(title: 'أشترك',
            textColor: Theme.of(context).colorScheme.onPrimary,
            radius: 8,
            onPressed: () {
              subCubit.subscriptionBottomSheet(context, (){});
            },
          ),
          const SizedBox(height: 20,),

        ],
      ),
    );

  }
}
