import 'package:Basera/core/utility/theme.dart';
import 'package:Basera/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utility/size_config.dart';

void main() {
  runApp(const MyApp());

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
    return MaterialApp(
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
  }
}
