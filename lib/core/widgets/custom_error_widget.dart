import 'package:Basera/core/utility/size_config.dart';
import 'package:flutter/material.dart';
class CustomErrorWidget extends StatelessWidget {
  final String text;
  const CustomErrorWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: SizeConfig.screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset('lib/assets/images/err-image.png'),
              Text(
                text,
                textAlign: TextAlign.center,
                style:  TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
