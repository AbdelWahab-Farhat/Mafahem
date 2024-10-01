import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/core/widgets/custom_app_bar.dart';
import 'package:Basera/features/notification/presentation/views/widgets/notification_widget_item.dart';
import 'package:flutter/material.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(const Duration(seconds: 1));
      },
      child: Scaffold(
        appBar: const CustomAppBar(title: 'الاشعارات'),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const NotificationWidgetItem(
                title: 'خصومات على كورسات الاطفال',
                content:
                    'خصومات تصل الى 50% على كورسات الاطفال من سن 10 الى سن 15');
            },
          ),
        ),
      ),
    );
  }
}
