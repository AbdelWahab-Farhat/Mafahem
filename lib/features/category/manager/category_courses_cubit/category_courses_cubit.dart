import 'package:Mafaheem/core/models/category.dart';
import 'package:Mafaheem/core/models/course.dart';
import 'package:Mafaheem/features/category/data/get_courses_by_category_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'category_courses_state.dart';

class CategoryCoursesCubit extends Cubit<CategoryCoursesState> {
  final Category category;
  late final List<Course> categoryCourses;
  CategoryCoursesCubit(this.category) : super(CategoryCoursesInitial()){
    getCategoryCourses();
  }

  Future<void> getCategoryCourses() async {
    emit(CategoryCoursesLoading());
    var result = await GetCoursesByCategoryService.fetchCoursesByCategory(category);
    result.fold(
          (failure) => emit(CategoryCoursesFailure(errMessage: failure.message)),
          (items) {
            categoryCourses = items;
        emit(CategoryCoursesSuccess());
      },
    );
  }
}
