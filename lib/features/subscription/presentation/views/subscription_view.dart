import 'package:Basera/features/subscription/presentation/manager/subscription_cubit/subsciption_cubit.dart';
import 'package:Basera/features/subscription/presentation/views/widgets/subscription_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionView extends StatelessWidget {
  const SubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubscriptionCubit(),
      child: const SubscriptionViewBody(),
    );
  }
}
