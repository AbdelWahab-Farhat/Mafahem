import 'package:Mafaheem/features/work_shops/presentation/manager/work_shop_cubit/work_shop_cubit.dart';
import 'package:Mafaheem/features/work_shops/presentation/views/widgets/work_shops_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkShopsView extends StatelessWidget {
  const WorkShopsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkShopCubit(),
      child: const WorkShopsViewBody(),
    );
  }
}
