import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  bool isDark = false;
  ThemeCubit() : super(ThemeChanged());

  Future<void> onThemeChange(value) async {
    isDark = value;
    var sp = await SharedPreferences.getInstance();
    sp.setBool('isDark', value);
    emit(ThemeChanged());
  }
}
