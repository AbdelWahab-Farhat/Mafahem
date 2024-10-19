abstract class Routes {
  static const String BASE_URL = 'http://192.168.112.140:3000/api';
  static const String LOGIN_URL = '$BASE_URL/login';
  static const String LOGOUT_URL = '$BASE_URL/logout';
  static const String REGISTER_URL = '$BASE_URL/register';
  static const String USER_BY_TOKEN_URL = '$BASE_URL/me';
  static const String REST_PASSWORD_URL = '$BASE_URL/forget-password';
  static const String ROAD_MAPS_URL = "$BASE_URL/roadmaps";
  static const String CATEGORY_URL = "$BASE_URL/course-categories";
  static const String USER_COURSES_URL = "$BASE_URL/enroll/index";
  static const String USER_ROAD_MAPS = "$BASE_URL/roadmapss/enrollments";
  static const String USER_CERTIFICATE_URL = "$BASE_URL/courses/certificate/get";
  static const String USER_CART_URL = "$BASE_URL/carts";
  static const String APPLY_COUPON_URL = "$BASE_URL/coupons/by/code";
  static const String REMOVE_FROM_CART = "$BASE_URL/carts/remove/item";
  static const String ORDER_URL = "$BASE_URL/orders";
  static const String PROMO_COURSES_URL ="$BASE_URL/courses/random/get";
  static const String RATE_COURSES_URL ="$BASE_URL/courses/rate";
  static const String COURSE_REVIEW_URL ="$BASE_URL/courses/make/reviews";
  static const String GET_COURSE_BY_ID_URL="$BASE_URL/courses";
  static const String GET_COURSES_URL="$BASE_URL/courses";
  static const String ADD_TO_USER_CART="$BASE_URL/carts";
  static const String GET_USER_COURES_URL ="$BASE_URL/users/courses/get";
  static String MARK_LEACTURE_PROGRESS_COMPLETED(String courseId , String lessonId , String lectureId) {
      return '$BASE_URL/courses/$courseId/lessons/$lessonId/lectures/$lessonId/complete';
  }
}
