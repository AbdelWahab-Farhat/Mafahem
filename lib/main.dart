import 'dart:developer';
import 'package:Mafaheem/core/dependency_injection.dart';
import 'package:Mafaheem/core/utility/theme.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:Mafaheem/features/Auth/presentation/views/auth_guard.dart';
import 'package:Mafaheem/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:Mafaheem/features/setting/presentation/manager/Theme_cubit/theme_cubit.dart';
import 'package:Mafaheem/features/work_shops/presentation/views/work_shop_detail_view.dart';
import 'package:Mafaheem/features/work_shops/presentation/views/work_shops_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/utility/size_config.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await Firebase.initializeApp();
  var sp = await SharedPreferences.getInstance();
  log(sp.getString('token') ?? 'no token');
  var isDark = sp.getBool('isDark') ?? false;
  log(isDark.toString());
  bool isFirstTime = !sp.containsKey('isFirstTime');
  if (isFirstTime) {
    await sp.setBool('isFirstTime', false);
  }
  runApp(BlocProvider(
    create: (context) => ThemeCubit(),
    child: MyApp(isFirstTime: isFirstTime, isDark: isDark,),
  ));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;
  final bool isDark;

  const MyApp({super.key, required this.isFirstTime, required this.isDark});
  @override
  Widget build(BuildContext context) {
    var themeCubit = context.read<ThemeCubit>();
    themeCubit.isDark = isDark;
    MaterialTheme theme = const MaterialTheme();
    return BlocProvider(
      create: (context) => GetIt.instance.get<TokenCubit>(),
      child: Builder(
        builder: (context) {
          SizeConfig.init(context);
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                theme: themeCubit.isDark ? theme.dark() : theme.light(),
                themeAnimationStyle: AnimationStyle(
                  duration: kThemeAnimationDuration,
                  curve: Curves.fastOutSlowIn,
                  reverseCurve: Curves.fastOutSlowIn,
                  reverseDuration: kThemeAnimationDuration,
                ),

                debugShowCheckedModeBanner: false,
                home: isFirstTime ? const OnBoardingView() : const AuthGuard(),
                builder: (context, child) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: child!,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
