import 'package:Basera/core/widgets/custom_app_bar.dart';
import 'package:Basera/features/setting/presentation/views/widgets/term_point_widget.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsViewBody extends StatelessWidget {
  const TermsAndConditionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'الشروط والإحكام'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            TermPointWidget('1. قبول الشروط',
                'من خلال تفعيل [اسم التطبيق المحمول] أو تنشيطه أو الوصول إليه أو استخدامه، فإنك توافق على الالتزام بهذه الشروط والأحكام.'),
            TermPointWidget('2. الترخيص',
                'نحتفظ بحقوق غير حصرية وغير قابلة للتنازل لاستخدام مفاهيم لأغراض شخصية فقط.'),
            TermPointWidget('3. حساب المستخدم',
                'قد يتطلب عليك إنشاء حساب [اسم التطبيق المحمول] لإنشاء حساب. أنت مسؤول عن الحفاظ على معلومات حسابك وعند جمع الأنشطة التي تتم تحت حسابك.'),
            TermPointWidget('4. استخدام التطبيق',
                'أنت توافق على استخدام [اسم التطبيق المحمول] الخاص بك وفقًا للإعلانات القانونية بطريقة تتفق مع جميع القوانين واللوائح.'),
            TermPointWidget('5. تعديل الشروط',
                'نحتفظ بالحق في تعديل هذه الشروط في أي وقت. سيتم إخطارك بالتغييرات عبر [طريقة الإخطار].'),
            TermPointWidget('6. تحديد المسؤولية',
                'لن نكون مسؤولين عن أي أضرار ناتجة عن استخدامك لـ [اسم التطبيق المحمول]، بما في ذلك، على سبيل المثال لا الحصر، الأضرار المباشرة أو غير المباشرة.'),
            TermPointWidget('7. قانون الحماية',
                'تخضع هذه الشروط للقوانين المعمول بها في ليبيا وفقًا للقانون الشرعي للعالم.'),
            TermPointWidget('8. الاتصال بنا',
                'إذا كانت لديك أي أسئلة حول هذه الشروط، يرجى الاتصال بنا على abdelwahab.dev@gmail.com.'),
          ],
        ),
      ),
    );
  }
}


