import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void push(BuildContext context, Widget widget,
    {PageTransitionType pageTransitionType = PageTransitionType.fade}) {
  Navigator.push(
    context,
    PageTransition(type: pageTransitionType, child: widget),
  );
}

void pop(BuildContext context) {
  Navigator.pop(context);
}

void pushReplacement(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
    context,
    PageTransition(type: PageTransitionType.fade, child: widget),
  );
}

void pushAndRemoveUntil(BuildContext context, Widget widget) {
  Navigator.pushAndRemoveUntil(
    context,
    PageTransition(
        type: PageTransitionType.scale,
        child: widget,
        duration: const Duration(milliseconds: 1000),
        alignment: Alignment.center),
    (route) => false,
  );
}
