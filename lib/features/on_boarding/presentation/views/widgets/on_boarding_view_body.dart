import 'package:Basera/core/utility/helper.dart';
import 'package:Basera/core/widgets/custom_filled_button.dart';
import 'package:Basera/features/Auth/presentation/views/login_view.dart';
import 'package:Basera/features/on_boarding/presentation/views/widgets/custom_page_item.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  String btnTitle = 'التالي';
  final controller = PageController();
  int count = 2;  // Total number of pages

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      int currentPage = controller.page?.round() ?? 0;
      if (currentPage == count - 1) {
        setState(() {
          btnTitle = 'أبدا';
        });
      } else {
        setState(() {
          btnTitle = 'التالي';
        });
      }
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              children: const [
                CustomPageItem(
                    title: 'معا للعطاء',
                    content:
                    'تسهيل العطاء والخير عبر التكنولوجيا، حيث يجمع بين الأفراد الذين يرغبون في تقديم الدعم والمساعدات مع المحتاجين.',
                    imageUrl: 'lib/assets/images/onboarding1.png'),
                CustomPageItem(
                    title: 'أكفال للمساكين',
                    content:
                    'هنا لنساعدك في تقديم الدعم والمساعدة لمن هم في حاجة في “عطاء” , نسعى لتوفير موارد وخدمات تساعد المساكين في تحسين حياتهم.',
                    imageUrl: 'lib/assets/images/onboarding2.png'),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: count,
            effect:  WormEffect(activeDotColor: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(
            height: 64,
          ),
          CustomFilledButton(
            color: Theme.of(context).colorScheme.primary,
            title: btnTitle,
            onPressed: () {
              if (controller.page?.round() == count - 1) {
                pushAndRemoveUntil(context, const LoginView());
              } else {
                // Navigate to the next page
                controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              }
            },
          ),
          const SizedBox(
            height: 64,
          ),
        ],
      ),
    );
  }
}
