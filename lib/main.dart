
import 'dart:developer';

import 'package:Basera/core/dependency_injection.dart';
import 'package:Basera/core/utility/theme.dart';
import 'package:Basera/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:Basera/features/Auth/presentation/views/auth_guard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utility/size_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  setup();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View
        .of(context)
        .platformDispatcher
        .platformBrightness;

    MaterialTheme theme = const MaterialTheme();
    SizeConfig.init(context);
    return BlocProvider(
      create: (context) => TokenCubit(),
      child: MaterialApp(
        theme: brightness == Brightness.light ? theme.light() : theme.dark(),
        debugShowCheckedModeBanner: false,
        home: const AuthGuard(),
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          );
        },
      ),
    );
  }
}
