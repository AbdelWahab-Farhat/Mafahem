import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';

class NotificationWidgetItem extends StatelessWidget {
  final String title;
  final String content;
  final bool isNew = true;
  const NotificationWidgetItem({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 24),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 0.2,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'خصومات على كورسات الاطفال',
                style: Styles.style16(context)
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                'خصومات تصل الى 50% على كورسات الاطفال من سن 10 الى سن  15',
                style: Styles.style14(context)
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              )
            ],
          ),
        ),
        isNew
            ? Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.only(top: 10, left: 10),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.error,
              shape: BoxShape.circle,
            ),
          ),
        )
            : const SizedBox(),
      ],
    );
  }
}
