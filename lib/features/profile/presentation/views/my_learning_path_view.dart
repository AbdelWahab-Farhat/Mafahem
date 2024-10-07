import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/features/profile/presentation/views/widgets/profile_card.dart';
import 'package:flutter/material.dart';

class MyLearningPathView extends StatelessWidget {
  const MyLearningPathView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      children: [
         ProfileCard(
          title: 'علوم الحاسب',
          subTitle: 'ستتعلم كيفية تشخيص الأعطال،استبدال المكونات الداخلية،وإصلاح المشاكل الشائعة في الأجهزة والنظام...',
          image: 'lib/assets/images/Roadmap-to-Learn-JavaScript-For-Beginners 1.png',
          rightWidget: Text("100%",style: Styles.style14(context).copyWith(fontWeight: FontWeight.w600),),
          leftWidget: SizedBox(
              width: SizeConfig.screenWidth * 0.8,
              child: const LinearProgressIndicator(
                borderRadius: BorderRadius.all(Radius.circular(32)),
                value: 0.7,
                minHeight: 8,
              )),
        ),
      ],
    );
  }
}

