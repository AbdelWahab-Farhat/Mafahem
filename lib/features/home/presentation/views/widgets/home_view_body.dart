import 'dart:io';
import 'package:Mafaheem/core/apis/fire_base_api.dart';
import 'package:Mafaheem/core/utility/functions/navigate_functions.dart';
import 'package:Mafaheem/core/widgets/custom_search_field.dart';
import 'package:Mafaheem/features/home/presentation/manager/promo_courses_cubit/promo_courses_cubit.dart';
import 'package:Mafaheem/features/home/presentation/views/widgets/categories_section.dart';
import 'package:Mafaheem/features/home/presentation/views/widgets/custom_carouse_slider.dart';
import 'package:Mafaheem/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:Mafaheem/features/home/presentation/views/widgets/most_ordered_list_view.dart';
import 'package:Mafaheem/features/home/presentation/views/widgets/section_title.dart';
import 'package:Mafaheem/features/home/presentation/views/widgets/work_shop_section.dart';
import 'package:Mafaheem/features/search/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
     FireBaseApi().initNotifications();
     context.read<PromoCoursesCubit>().getPromoCourses();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {

        },
        child: SingleChildScrollView(
          physics: Platform.isIOS ? const BouncingScrollPhysics() : const ClampingScrollPhysics(),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomSearchField(
                  onTap: () => push(context, const SearchView()),
                  hintText: 'ابحث..',
                  icon: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSurface,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.search,
                        color: Theme.of(context).colorScheme.surface,
                        size: 15,
                      )),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const CustomCarouseSlider(),
              const SizedBox(
                height: 32,
              ),
              const CategoriesSection(),
              const SizedBox(
                height: 32,
              ),
              const WorkShopsSection(),
              const SizedBox(
                height: 32,
              ),
              const SectionTitle(title: 'الاكثر طلبا'),
              const SizedBox(
                height: 8,
              ),
              const MostOrderedListView()
            ],
          ),
        ),
      ),
    );
  }
}




