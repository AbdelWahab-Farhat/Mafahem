import 'package:Mafaheem/core/models/work_shop.dart';
import 'package:Mafaheem/features/work_shops/presentation/views/widgets/description_section.dart';
import 'package:Mafaheem/features/work_shops/presentation/views/widgets/header_section.dart';
import 'package:Mafaheem/features/work_shops/presentation/views/widgets/instructor_section.dart';
import 'package:Mafaheem/features/work_shops/presentation/views/widgets/related_work_shop_section.dart';
import 'package:Mafaheem/features/work_shops/presentation/views/widgets/sign_now_button.dart';
import 'package:flutter/material.dart';


class WorkShopDetailViewBody extends StatelessWidget {
  final WorkShop workShop;

  const WorkShopDetailViewBody({
    super.key,
    required this.workShop,
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 48),
        child: CustomScrollView(
          physics: const RangeMaintainingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: HeaderSection(workShop: workShop,),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 16),
            ),

            // Sliver for DescriptionSection
            SliverToBoxAdapter(
              child: DescriptionSection(description: workShop.description,),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 32),
            ),

            // Sliver for InstructorSection
             SliverToBoxAdapter(
              child: InstructorSection(workShop: workShop,),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 32),
            ),

            // Sliver for OtherWorkShopSection
            const SliverToBoxAdapter(
              child: RelatedWorkShopSection(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 16),
            ),

            // Sliver for SignNowButton
            const SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Spacer(),
                  SignNowButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

