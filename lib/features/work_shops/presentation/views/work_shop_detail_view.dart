import 'package:Mafaheem/core/models/work_shop.dart';
import 'package:Mafaheem/features/work_shops/presentation/manager/Instructor_cubit/instructor_cubit.dart';
import 'package:Mafaheem/features/work_shops/presentation/manager/register_on_work_shop_cubit/register_on_work_shop_cubit.dart';
import 'package:Mafaheem/features/work_shops/presentation/manager/work_shop_detail_cubit/work_shop_detail_cubit.dart';
import 'package:Mafaheem/features/work_shops/presentation/views/widgets/work_shop_detail_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class WorkShopDetailView extends StatelessWidget {
  final WorkShop workShop;

  const WorkShopDetailView({super.key, required this.workShop,});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WorkShopDetailCubit(),
        ),
        BlocProvider(
          create: (context) => InstructorCubit(workShop.instructorId.toString()),
        ),
        BlocProvider(create: (context) => RegisterOnWorkShopCubit(workShop),)
      ],
      child: WorkShopDetailViewBody(workShop: workShop),
    );
  }
}
