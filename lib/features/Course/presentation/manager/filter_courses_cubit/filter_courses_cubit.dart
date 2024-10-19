import 'package:Basera/core/models/course.dart';
import 'package:Basera/features/Course/data/get_courses_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'filter_courses_state.dart';

class FilterCoursesCubit extends Cubit<FilterCoursesState> {
  late List<Course> similarCourses;
  FilterCoursesCubit() : super(FilterCoursesInitial());

  void getSimilarCourses(Course course) async {
    emit(FilterCoursesLoading());
    if (course.categories == null) {
      similarCourses = [];
      emit(FilterCoursesSuccess());
    } else {
      var result = await GetCoursesService.fetchCoursesByCourseCategory(
          course.categories!);
      result.fold(
        (failure) => emit(FilterCoursesFailure(message: failure.message)),
        (r) {
           similarCourses = r;
           emit(FilterCoursesSuccess());
        } ,
      );
    }
  }
}
