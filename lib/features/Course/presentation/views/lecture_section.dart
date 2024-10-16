import 'dart:math';

import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';

class LectureSection extends StatelessWidget {
  const LectureSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent, // Removes divider
        splashColor: Colors.transparent, // Removes splash color
        highlightColor: Colors.transparent, // Removes highlight color
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 16),
            // First Lesson with border radius and shadow
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                gradient: Styles.customLinerGradient(context),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: const Offset(0, 2), // shadow y = 2
                  ),
                ],
              ),
              child:  ExpansionTile(
                backgroundColor: Colors.transparent,
                collapsedBackgroundColor: Colors.transparent,
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                collapsedShape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)) ,
                title:  Text(
                  'الدرس الأول',
                  style: Styles.style18(context).copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
                children: <Widget>[
                  ListTile(
                    title: Text('المقدمة',style: Styles.style16(context).copyWith(color: Theme.of(context).colorScheme.onPrimary),),
                  ),
                ],
              ),
            ),
            // Second Lesson with border radius and shadow
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
