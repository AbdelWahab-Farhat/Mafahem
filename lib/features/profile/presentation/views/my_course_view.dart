import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/features/profile/presentation/views/widgets/profile_card.dart';
import 'package:flutter/material.dart';

class MyCourseView extends StatelessWidget {
  const MyCourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(
        physics: ClampingScrollPhysics(),

        padding: EdgeInsets.only(top: 20,left: 20,right: 20),
        children: [
      ProfileCard(
        title: ' الدورات التدريبية',
        subTitle: "التوجه: للمبتدئيين",
        image: 'lib/assets/images/course-image.png',
        leftWidget: Text('تاريخ البدأ:2025/01/01',style: Styles.style12(context).copyWith(color:Theme.of(context).colorScheme.secondary)),
        rightWidget: Text('تاريخ الانتهاء:2027/01/01',style: Styles.style12(context).copyWith(color:Theme.of(context).colorScheme.secondary),),
      ),
      ProfileCard(
        title: ' الدورات التدريبية',
        subTitle: "التوجه: للمبتدئيين",
        image: 'lib/assets/images/course-image.png',
        leftWidget: Text('تاريخ البدأ:2025/01/01',style: Styles.style12(context).copyWith(color:Theme.of(context).colorScheme.secondary)),
        rightWidget: Text('تاريخ الانتهاء:2027/01/01',style: Styles.style12(context).copyWith(color:Theme.of(context).colorScheme.secondary),),
      ),
      ProfileCard(
        title: ' الدورات التدريبية',
        subTitle: "التوجه: للمبتدئيين",
        image: 'lib/assets/images/course-image.png',
        leftWidget: Text('تاريخ البدأ:2025/01/01',style: Styles.style12(context).copyWith(color:Theme.of(context).colorScheme.secondary)),
        rightWidget: Text('تاريخ الانتهاء:2027/01/01',style: Styles.style12(context).copyWith(color:Theme.of(context).colorScheme.secondary),),
      ),
      ProfileCard(
        title: ' الدورات التدريبية',
        subTitle: "التوجه: للمبتدئيين",
        image: 'lib/assets/images/course-image.png',
        leftWidget: Text('تاريخ البدأ:2025/01/01',style: Styles.style12(context).copyWith(color:Theme.of(context).colorScheme.secondary)),
        rightWidget: Text('تاريخ الانتهاء:2027/01/01',style: Styles.style12(context).copyWith(color:Theme.of(context).colorScheme.secondary),),
      ),

    ]);
  }
}




