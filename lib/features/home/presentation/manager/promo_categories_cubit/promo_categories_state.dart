part of 'promo_categories_cubit.dart';

@immutable
sealed class PromoCategoriesState {}

final class PromoCategoriesLoading extends PromoCategoriesState {}
final class PromoCategoriesSuccess extends PromoCategoriesState {
  final List<Category> categories;
  PromoCategoriesSuccess({required this.categories});
}
final class PromoCategoriesFailure extends PromoCategoriesState {
  final String errMessage;
  PromoCategoriesFailure({required this.errMessage});
}
