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
                color: Colors.white,
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
              child: const ExpansionTile(
                title: Text(
                  'الدرس الأول',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  ListTile(
                    title: Text('المقدمة'),
                  ),
                ],
              ),
            ),
            // Second Lesson with border radius and shadow
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 2), // shadow y = 2
                  ),
                ],
              ),
              child: const ExpansionTile(
                title: Text(
                  'الدرس الثاني',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.play_circle_filled),
                    title: Text('المحاضرة الأولى'),
                  ),
                  ListTile(
                    leading: Icon(Icons.play_circle_filled),
                    title: Text('المحاضرة الثانية'),
                  ),
                  ListTile(
                    leading: Icon(Icons.play_circle_filled),
                    title: Text('المحاضرة الثالثة'),
                  ),
                  ListTile(
                    leading: Icon(Icons.play_circle_filled),
                    title: Text('المحاضرة الرابعة'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
