import 'package:Basera/features/Auth/presentation/views/login_view.dart';
import 'package:Basera/features/splash/presentation/views/widgets/custom_app_title.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utility/helper.dart';
class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 2),() => push(context, const LoginView()),),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
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
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
