import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/core/utility/styles.dart';
import 'package:flutter/material.dart';

class PrivateLessonsViewBody extends StatelessWidget {
  const PrivateLessonsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('lib/assets/images/coming-soon.png',width: SizeConfig.screenWidth * 0.8,),
            const SizedBox(
              height: 20,
            ),
            Text(
              textAlign: TextAlign.center,
              'سيتم أضافة خاصية \nالكورسات الخصوصية قريبا ...',
              style: Styles.style18(context),
            ),
          ],
        ),
      ),
    );
  }
}
