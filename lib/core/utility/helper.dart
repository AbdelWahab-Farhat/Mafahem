import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void push(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    PageTransition(type: PageTransitionType.fade, child: widget),
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
    PageTransition(type: PageTransitionType.fade, child: widget),
        (route) => false,
  );
}
