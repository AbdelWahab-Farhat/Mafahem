import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/core/utility/styles.dart';
import 'package:Mafaheem/core/widgets/custom_app_bar.dart';
import 'package:Mafaheem/features/subscription/presentation/manager/subscription_cubit/subsciption_cubit.dart';
import 'package:Mafaheem/features/subscription/presentation/views/free_subscription_page.dart';
import 'package:Mafaheem/features/subscription/presentation/views/premium_subscription_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SubscriptionViewBody extends StatelessWidget {
  const SubscriptionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var subCubit = context.read<SubscriptionCubit>();
    return Scaffold(
        appBar: const CustomAppBar(title: 'ادارة الاشتراكات'),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: subCubit.pageController,
          children: const [
            FreeSubscriptionPage(),
            PremiumSubscriptionPage()
          ],
        ),
    );
  }
}

class SubPoint extends StatelessWidget {
  final String title;
  const SubPoint({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        FontAwesomeIcons.solidCircleCheck,
        color: Theme.of(context).colorScheme.primary,
        size: 25,
      ),
      title: Text(
        title,
        style: Styles.style16(context),
      ),
    );
  }
}

class CurrentSubscription extends StatelessWidget {
  final String title;
  final bool isFreePLan;
  const CurrentSubscription({
    super.key, required this.title,
    this.isFreePLan = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight * 0.1,
      margin: const EdgeInsets.only(bottom: 36, top: 24),
      padding: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: Styles.customLinerGradient(context,begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Styles.style24(context)
                .copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
          Text(isFreePLan ? 'مفعلة' : 'غير مفعلة',
              style: Styles.style18(context).copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
