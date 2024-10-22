import 'package:Mafaheem/core/models/category.dart';
import 'package:Mafaheem/features/category/data/get_categories_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'promo_categories_state.dart';

class PromoCategoriesCubit extends Cubit<PromoCategoriesState> {
  PromoCategoriesCubit() : super(PromoCategoriesLoading()){
    getPromoCategories();
  }

  Future<void> getPromoCategories() async {
    emit(PromoCategoriesLoading());
    var result =
        await GetCategoriesService(dio: GetIt.I<Dio>()).fetchCategories();
    result.fold((l) => emit(PromoCategoriesFailure(errMessage: l.message)),
        (r) => emit(PromoCategoriesSuccess(categories: r)));
  }
}
