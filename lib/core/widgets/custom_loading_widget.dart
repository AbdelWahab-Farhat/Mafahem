import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Center(
        child: spinKit(context),
    );
  }
}

  spinKit(BuildContext context){
    return SpinKitFoldingCube(
        size: 35,
        duration: const Duration(seconds: 1),
        color: Theme.of(context).colorScheme.primary);
  }
