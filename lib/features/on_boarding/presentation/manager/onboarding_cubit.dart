import 'package:Basera/core/utility/functions/navigate_functions.dart';
import 'package:Basera/features/Auth/presentation/views/login_view.dart';
import 'package:Basera/features/on_boarding/presentation/views/widgets/custom_page_item.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  String buttonTitle = 'التالي';
  final int count = 3;
  final PageController controller = PageController();

  List<CustomPageItem> items = [
    const CustomPageItem(
        title: 'معا للعطاء',
        content:
        'تسهيل العطاء والخير عبر التكنولوجيا، حيث يجمع بين الأفراد الذين يرغبون في تقديم الدعم والمساعدات مع المحتاجين.',
        imageUrl: 'lib/assets/images/on-borading1.png'),
    const CustomPageItem(
        title: 'أكفال للمساكين',
        content:
        'هنا لنساعدك في تقديم الدعم والمساعدة لمن هم في حاجة في “عطاء” , نسعى لتوفير موارد وخدمات تساعد المساكين في تحسين حياتهم.',
        imageUrl: 'lib/assets/images/on-borading-2.png'),
    const CustomPageItem(
        title: 'أكفال للمساكين',
        content:
        'هنا لنساعدك في تقديم الدعم والمساعدة لمن هم في حاجة في “عطاء” , نسعى لتوفير موارد وخدمات تساعد المساكين في تحسين حياتهم.',
        imageUrl: 'lib/assets/images/on-borading-3.png'),
  ];

  changeTitleDependsOnPage() {
    controller.addListener(() {
      int currentPage = controller.page?.round() ?? 0;
      if (currentPage == count - 1) {
          buttonTitle = 'أبدا';
          emit(OnboardingInitial());
      } else {
          buttonTitle = 'التالي';
          emit(OnboardingInitial());
      }
    });
  }

  navigateTo(BuildContext context) {
    if (controller.page?.round() == count - 1) {
      pushAndRemoveUntil(context, const LoginView());
    } else {
      controller.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut);
    }
  }
}
