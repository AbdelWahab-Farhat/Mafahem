import 'package:Mafaheem/core/models/course.dart';
import 'package:Mafaheem/features/home/data/promo_courses_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'promo_courses_state.dart';

class PromoCoursesCubit extends Cubit<PromoCoursesState> {
  PromoCoursesCubit() : super(PromoCoursesInitial());

  Future<void> getPromoCourses() async {
    emit(PromoCoursesLoading());
    var result = await PromoCoursesService.getPromoCourses();
    result.fold((l) => emit(PromoCoursesFailure(message: l.message)), (r) {
      emit(PromoCoursesSuccess(courses: r));
    });
  }
}
