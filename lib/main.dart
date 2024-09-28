import 'package:ataa/constant.dart';
import 'package:ataa/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

import 'core/utility/size_config.dart';


void main(){

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return  MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: kSurface
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
