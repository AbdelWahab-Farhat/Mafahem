import 'package:Mafaheem/core/utility/functions/navigate_functions.dart';
import 'package:Mafaheem/features/Auth/presentation/views/login_view.dart';
import 'package:Mafaheem/features/on_boarding/presentation/views/widgets/custom_page_item.dart';
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
        title: 'جميع المراحل التعليمية',
        content:
            ' تشمل كافة المراحل من الروضة الى حين التخرج ، مما يوفر محتوى تعليميًا مناسبًا لكل فئة عمرية. نسعى لتقديم مواد تعليمية متنوعة ومبسطة تساهم في تحسين فهم الطلاب وتعزيز تحصيلهم الأكاديمي.',
        imageUrl: 'lib/assets/images/on-borading1.png'),
    const CustomPageItem(
        title: 'خبراء في جميع المجالات',
        content:
            'يتميزون بمهاراتهم وخبراتهم الواسعة، جاهزون لتقديم المعرفة والدعم في كل التخصصات. نسعى لتوفير تعليم عالي الجودة بإشراف نخبة من المحترفين لضمان تحقيق أفضل النتائج الأكاديمية والعملية.',
        imageUrl: 'lib/assets/images/on-borading-2.png'),
    const CustomPageItem(
        title: 'شهادات موثوقة ومعتمدة',
        content:
            'تمنحك ميزة تنافسية وتؤكد على كفاءتك ومعرفتك المعترف بها دوليًا ومحليًا، مما يفتح أمامك فرصًا أوسع في سوق العمل والتطوير المهني.',
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
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }
}
