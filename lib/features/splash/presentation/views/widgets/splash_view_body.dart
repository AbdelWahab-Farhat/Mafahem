import 'package:Basera/core/widgets/custom_loading_widget.dart';
import 'package:Basera/features/splash/presentation/views/widgets/custom_app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'lib/assets/icons/logo-with-text.svg',
                    width: 200.02,
                    height: 180.97,
                  ),
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

