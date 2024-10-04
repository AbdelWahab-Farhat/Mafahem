import 'package:Basera/core/widgets/custom_loading_widget.dart';
import 'package:Basera/features/splash/presentation/views/widgets/custom_app_title.dart';
import 'package:flutter/material.dart';
class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/assets/images/logo-test.png',
                    width: 189.02,
                    height: 120.97,
                  ),
                  const CustomAppTitle(),
                  const SizedBox(
                    height: 32,
                  ),
                  const CustomLoadingWidget(),
                ],
              ),
            ),
          );
        }
      }

