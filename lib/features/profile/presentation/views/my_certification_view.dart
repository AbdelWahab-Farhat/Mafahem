import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/core/widgets/custom_icon_button.dart';
import 'package:Basera/features/profile/presentation/views/widgets/profile_card.dart';
import 'package:flutter/material.dart';

class MyCertificationView extends StatelessWidget {
  const MyCertificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      children: [
        ProfileCard(
          title: 'علوم الحاسب',
          subTitle: "التوجه: للمبتدئيين",
          image: 'lib/assets/images/Roadmap-to-Learn-JavaScript-For-Beginners 1.png',
          leftWidget: Text('تاريخ الحصول:2025/01/01',
              style: Styles.style12(context)
                  .copyWith(color: Theme.of(context).colorScheme.secondary)),
          rightWidget: CustomIconButton(
            title: 'تحميل',
            onPressed: () {},
            width: 120,
            height: 35,
            icon: Icon(Icons.downloading_outlined,color: Theme.of(context).colorScheme.onPrimary,),
            textColor: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
            radius: 32,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        ProfileCard(
          title: 'علوم الحاسب',
          subTitle: "التوجه: للمبتدئيين",
          image: 'lib/assets/images/Roadmap-to-Learn-JavaScript-For-Beginners 1.png',
          leftWidget: Text('تاريخ الحصول:2025/01/01',
              style: Styles.style12(context)
                  .copyWith(color: Theme.of(context).colorScheme.secondary)),
          rightWidget: CustomIconButton(
            title: 'تحميل',
            onPressed: () {},
            width: 120,
            height: 35,
            icon: Icon(Icons.downloading_outlined,color: Theme.of(context).colorScheme.onPrimary,),
            textColor: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
            radius: 32,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        ProfileCard(
          title: 'علوم الحاسب',
          subTitle: "التوجه: للمبتدئيين",
          image: 'lib/assets/images/Roadmap-to-Learn-JavaScript-For-Beginners 1.png',
          leftWidget: Text('تاريخ الحصول:2025/01/01',
              style: Styles.style12(context)
                  .copyWith(color: Theme.of(context).colorScheme.secondary)),
          rightWidget: CustomIconButton(
            title: 'تحميل',
            onPressed: () {},
            width: 120,
            height: 35,
            icon: Icon(Icons.downloading_outlined,color: Theme.of(context).colorScheme.onPrimary,),
            textColor: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
            radius: 32,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
