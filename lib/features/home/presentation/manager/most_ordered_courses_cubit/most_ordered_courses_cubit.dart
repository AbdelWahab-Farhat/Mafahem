import 'package:Mafaheem/core/models/course.dart';
import 'package:Mafaheem/features/home/data/most_ordered_courses_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'most_ordered_courses_state.dart';

class MostOrderedCoursesCubit extends Cubit<MostOrderedCoursesState> {
  MostOrderedCoursesCubit() : super(MostOrderedCoursesLoading()){
    getMostOrderedCourses();
  }

  Future<void> getMostOrderedCourses() async {
    var result = await MostOrderedCoursesService.getMostOrderedCourses();
    result.fold(
          (l) => emit(MostOrderedCoursesFailure(errMessage: l.message)),
          (courses) {
        emit(MostOrderedCoursesSuccess(courses: courses));
      },
    );
  }
}
