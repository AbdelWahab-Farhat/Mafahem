import 'package:Basera/core/models/category.dart';
import 'package:Basera/features/category/data/get_categories_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  List<Category> categories = [];
  CategoryCubit() : super(CategoryInitial());

  Future<void> fetchCategories() async {
    emit(CategoryLoading());
    var result = await GetCategoriesService(dio: GetIt.instance<Dio>()).fetchCategories();
    result.fold(
      (failure) => emit(CategoryFailure(errMessage: failure.message)),
      (items) {
        categories = items;
        emit(CategorySuccess());
      },
    );
  }
}

