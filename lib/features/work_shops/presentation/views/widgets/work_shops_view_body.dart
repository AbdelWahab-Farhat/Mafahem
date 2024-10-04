import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/core/widgets/custom_app_bar.dart';
import 'package:Basera/features/work_shops/presentation/views/widgets/monthly_work_shop_list_view.dart';
import 'package:Basera/features/work_shops/presentation/views/widgets/work_shop_Item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkShopsViewBody extends StatelessWidget {
  const WorkShopsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'ورش العـمل'),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          const WorkShopItem(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ورش عمل شهرية',
                style: Styles.style18(context)
                    .copyWith(fontFamily: GoogleFonts.changa().fontFamily),
              ),
              const SizedBox(
                height: 16,
              ),
              const MonthlyWorkShopListView(),
            ],
          )
        ],
      ),
    );
  }
}



