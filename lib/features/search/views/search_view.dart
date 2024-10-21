import 'package:Mafaheem/features/search/manager/category_picker_cubit/category_picker_cubit.dart';
import 'package:Mafaheem/features/search/manager/level_picker_cubit/level_picker_cubit.dart';
import 'package:Mafaheem/features/search/manager/price_range_cubit/price_range_cubit.dart';
import 'package:Mafaheem/features/search/manager/search_cubit/search_cubit.dart';
import 'package:Mafaheem/features/search/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PriceRangeCubit(),
        ),
        BlocProvider(
          create: (context) => LevelPickerCubit(),
        ),
        BlocProvider(
          create: (context) => CategoryPickerCubit(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(),
        )
      ],
      child: const SearchViewBody(),
    );
  }
}
