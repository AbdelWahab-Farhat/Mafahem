import 'package:Mafaheem/core/utility/functions/navigate_functions.dart';
import 'package:Mafaheem/core/utility/styles.dart';
import 'package:Mafaheem/core/widgets/custom_empty_state_widget.dart';
import 'package:Mafaheem/features/work_shops/presentation/manager/work_shop_detail_cubit/work_shop_detail_cubit.dart';
import 'package:Mafaheem/features/work_shops/presentation/views/work_shop_detail_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class RelatedWorkShopSection extends StatelessWidget {
  const RelatedWorkShopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ورش عمل أخرى',
          style: Styles.style18(context),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 80,
          child: BlocBuilder<WorkShopDetailCubit, WorkShopDetailState>(
            builder: (context, state) {
              if (state is WorkShopDetailFailure) {
                return CustomEmptyStateWidget(
                    title: 'هنالك خطأ صغير ..',
                    subTitle: state.errMessage,
                    image: Image.asset(
                      'lib/assets/images/Box.png',
                      width: 200,
                      height: 150,
                      fit: BoxFit.cover,
                    ));
              } else if (state is WorkShopDetailSuccess) {
                var workShops = context.read<WorkShopDetailCubit>().workShops;
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: workShops.length,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            // TODO WAIT YOUSSEF TO ADD IMAGE LATER
                            child: GestureDetector(
                              onTap: () => pushReplacement(
                                  context,
                                  WorkShopDetailView(
                                      workShop: workShops[index])),
                              child: CachedNetworkImage(
                                imageUrl: workShops[index].image!,
                                width: 150,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ));
              } else {
                return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(5, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'lib/assets/images/Roadmap-to-Learn-JavaScript-For-Beginners 1.png',
                              // Placeholder gallery images
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }),
                    ));
              }
            },
          ),
        ),
      ],
    );
  }
}
