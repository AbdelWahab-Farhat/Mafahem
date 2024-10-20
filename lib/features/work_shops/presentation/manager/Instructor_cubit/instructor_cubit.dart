import 'package:Mafaheem/core/models/instructor.dart';
import 'package:Mafaheem/features/work_shops/data/get_instructor_by_id_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'instructor_state.dart';

class InstructorCubit extends Cubit<InstructorState> {
  late final  Instructor instructor;
  final String currentInstructorId;
  InstructorCubit(this.currentInstructorId) : super(InstructorLoading()){
    getCurrentInstructor();
  }

  Future<void> getCurrentInstructor() async {
    var result = await GetInstructorByIdService.getInstructorById(currentInstructorId);
    result.fold(
          (l) => emit(InstructorFailure(errMessage: l.message)),
          (instructor) {
        this.instructor = instructor;
        emit(InstructorSuccess());
      },
    );
  }
}
