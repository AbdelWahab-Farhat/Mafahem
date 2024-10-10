
import 'package:Basera/core/models/course.dart';
import 'package:Basera/core/models/road_map.dart';
import 'package:Basera/features/Auth/data/certificate.dart';
import 'package:Basera/features/profile/data/fetch_user_certificate_service.dart';
import 'package:Basera/features/profile/data/fetch_user_courses_service.dart';
import 'package:Basera/features/profile/data/fetch_user_road_maps_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  List<Course> userCourses = [];
  List<RoadMap> userRoadMaps = [];
  List<Certificate> userCertificates = [];

  UserCubit() : super(UserLoading());

  Future<void> getUserItems() async {
    emit(UserLoading());

    var result = await Future.wait([
      FetchUserCoursesService.getUserCourses(),
      FetchUserRoadMapsService.getUserRoadMaps(),
      FetchUserCertificateService.getUserCertificate()
    ]);

    result[0].fold(
          (failure) => emit(UserFailure(errMessage: failure.message)), // Handle error for courses
          (courses) {
        userCourses = courses as List<Course>; // Update courses if successful
      },
    );
    result[1].fold(
          (failure) => emit(UserFailure(errMessage: failure.message)), // Handle error for roadmaps
          (roadMaps) {
        userRoadMaps = roadMaps as List<RoadMap>; // Update roadmaps if successful
      },
    );
    result[2].fold((failure) => emit(UserFailure(errMessage: failure.message)), // Handle error for roadmaps
          (certificates) {
        userCertificates = certificates as List<Certificate>;
      },
    );
    emit(UserSuccess());
  }
}


