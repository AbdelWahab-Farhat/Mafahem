import 'package:Basera/core/dependency_injection.dart';
import 'package:Basera/core/utility/theme.dart';
import 'package:Basera/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:Basera/features/Auth/presentation/views/auth_guard.dart';
import 'package:Basera/features/category/views/category_view.dart';
import 'package:Basera/features/home/presentation/views/home_view.dart';
import 'package:Basera/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:Basera/features/root/presentation/views/root_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/utility/size_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  var sp = await SharedPreferences.getInstance();
  bool isFirstTime = !sp.containsKey('isFirstTime');
  if (isFirstTime) {
    await sp.setBool('isFirstTime', false);
  }
  runApp(MyApp(isFirstTime: isFirstTime));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  const MyApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    MaterialTheme theme = const MaterialTheme();
    return BlocProvider(
      create: (context) => TokenCubit(),
      child: Builder(
        builder: (context) {
          SizeConfig.init(context);
          return MaterialApp(
            theme: brightness == Brightness.light ? theme.light() : theme.dark(),
            debugShowCheckedModeBanner: false,
            home: isFirstTime ? const OnBoardingView() : const RootView(),
            builder: (context, child) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}
