import 'package:Mafaheem/core/utility/styles.dart';
import 'package:Mafaheem/core/widgets/custom_app_bar.dart';
import 'package:Mafaheem/core/widgets/custom_card_list_view_shimmer.dart';
import 'package:Mafaheem/core/widgets/custom_empty_state_widget.dart';
import 'package:Mafaheem/features/work_shops/presentation/manager/work_shop_cubit/work_shop_cubit.dart';
import 'package:Mafaheem/features/work_shops/presentation/views/widgets/monthly_work_shop_list_view.dart';
import 'package:Mafaheem/features/work_shops/presentation/views/widgets/work_shop_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkShopsViewBody extends StatelessWidget {
  const WorkShopsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'ورش العـمل'),
      body: BlocBuilder<WorkShopCubit, WorkShopState>(
        builder: (context, state) {
          var workShopCubit = context.read<WorkShopCubit>();
          if (state is WorkShopFailure) {
            return CustomEmptyStateWidget(
                title: 'هنالك خطأ صغير ..',
                subTitle: state.errMessage,
                image: Image.asset('lib/assets/images/Box.png'));
          }
          else if (state is WorkShopSuccess) {
            var coverItem = workShopCubit.getCoverWorkShop();
            var workShops = workShopCubit.workShops.where((element) => element.id != coverItem.id,).toList();
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              children: [
                 WorkShopItem(workShopCoverItem: coverItem,),
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
                     MonthlyWorkShopListView(workShops: workShops,),
                  ],
                )
              ],
            );
          }
          else {
            return const CustomCardListViewShimmer();
          }
        },
      ),
    );
  }
}
