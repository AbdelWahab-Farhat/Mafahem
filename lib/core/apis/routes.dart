abstract class Routes {
  static const String BASE_URL = 'http://192.168.12.140:3000/api';
  static const String LOGIN_URL = '$BASE_URL/login';
  static const String LOGOUT_URL = '$BASE_URL/logout';
  static const String REGISTER_URL = '$BASE_URL/register';
  static const String USER_BY_TOKEN_URL = '$BASE_URL/me';
  static const String REST_PASSWORD_URL = '$BASE_URL/forget-password';
  static const String ROAD_MAPS_URL = "$BASE_URL/roadmaps";
  static const String CATEGORY_URL = "$BASE_URL/course-categories";
  static const String USER_COURSES_URL = "$BASE_URL/enroll/index";
  static const String USER_ROAD_MAPS = "$BASE_URL/roadmapss/enrollments";
  static const String USER_CERTIFICATE_URL =
      "$BASE_URL/courses/certificate/get";
}
