import 'dart:developer';

import 'package:Mafaheem/core/models/course.dart';
import 'package:Mafaheem/features/search/data/get_search_courses_service.dart';
import 'package:Mafaheem/features/search/manager/category_picker_cubit/category_picker_cubit.dart';
import 'package:Mafaheem/features/search/manager/level_picker_cubit/level_picker_cubit.dart';
import 'package:Mafaheem/features/search/manager/price_range_cubit/price_range_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  List<Course> courses = [];
  bool isDefaultFilters = true;
  TextEditingController searchController = TextEditingController();

  SearchCubit() : super(SearchLoading()) {
    getSearchCourses();
  }

  Future<void> getSearchCourses() async {
    var result = await GetSearchCoursesService.getSearchCourses();
    result.fold((l) => emit(SearchFailure(errMessage: l.message)), (courses) {
      this.courses = courses;
      emit(SearchSuccess(courses: courses));
    });
  }

  void onSearchChanged({
    required PriceRangeCubit priceRangeCubit,
    required LevelPickerCubit levelPickerCubit,
    required CategoryPickerCubit categoryPickerCubit,
  }) async {
    emit(SearchLoading());

    // Check if the filters are default and no search term is provided
    if (isDefaultFilters && searchController.text.isEmpty) {
      emit(SearchSuccess(courses: courses)); // No filtering needed, show all courses
      return;
    }

    // Make a copy of the original courses list
    var coursesCopy = List<Course>.from(courses);
    log(coursesCopy.length.toString());

    // Filter by selected levels
    if (levelPickerCubit.selectedLevels.isNotEmpty) {
      coursesCopy = coursesCopy.where(
            (course) => levelPickerCubit.selectedLevels.contains(course.level),
      ).toList();
    }

    // Filter by price range
    coursesCopy = coursesCopy.where((course) {
      final coursePrice = double.tryParse(course.price) ?? 0;
      return coursePrice >= priceRangeCubit.startValue &&
          coursePrice <= priceRangeCubit.endValue;
    }).toList();

    // Filter by selected categories (multi-category filtering)
    if (categoryPickerCubit.categoriesPicked.isNotEmpty) {
      // Get the keys (categories) where the value is `true` (i.e., selected)
      final selectedCategories = categoryPickerCubit.categoriesPicked.entries
          .where((entry) => entry.value) // Only categories where value is true
          .map((entry) => entry.key) // Extract the category keys
          .toList();

      if (selectedCategories.isNotEmpty) {
        coursesCopy = coursesCopy.where((course) {
          // Check if the course's categories overlap with the selected categories
          return course.categories?.any((category) => selectedCategories.contains(category)) ?? false;
        }).toList();
      }
    }

    // Filter by search term (applied at the end after other filters)
    final searchTerm = searchController.text.trim().toLowerCase();
    if (searchTerm.isNotEmpty) {
      coursesCopy = coursesCopy.where((course) {
        return course.title.toLowerCase().startsWith(searchTerm);
      }).toList();
    }

    // Emit the result based on filtered courses
    if (coursesCopy.isEmpty) {
      emit(SearchEmpty()); // No results found
    } else {
      emit(SearchSuccess(courses: coursesCopy)); // Display filtered courses
    }
    log(coursesCopy.length.toString());
  }
}