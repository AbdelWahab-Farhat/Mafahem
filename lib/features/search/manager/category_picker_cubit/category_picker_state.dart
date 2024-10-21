part of 'category_picker_cubit.dart';

@immutable
sealed class CategoryPickerState {}


final class CategoryPickerLoading extends CategoryPickerState {}
final class CategoryPickerFailure extends CategoryPickerState {
  final String errMessage;
  CategoryPickerFailure({required this.errMessage});
}
final class CategoryPickerSuccess extends CategoryPickerState {}