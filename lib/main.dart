import 'package:Basera/core/utility/theme.dart';
import 'package:Basera/features/Auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'core/utility/size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    MaterialTheme theme = const MaterialTheme();
    SizeConfig.init(context);
    return MaterialApp(
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
  }
}
