import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/core/widgets/custom_card_list_view_shimmer.dart';
import 'package:Basera/core/widgets/custom_empty_state_widget.dart';
import 'package:Basera/core/widgets/custom_error_widget.dart';
import 'package:Basera/core/widgets/custom_icon_button.dart';
import 'package:Basera/features/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:Basera/features/profile/presentation/views/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCertificationView extends StatelessWidget {
  const MyCertificationView({super.key});
  @override
  Widget build(BuildContext context) {
    var userCubit = context.read<UserCubit>();
    var userCertificates = userCubit.userCertificates;
    // TODO DON'T FORGET THE BUTTON FUNCTIONALITY FOR DOWNLOAD !! AND ADDING IMAGE OR PDF TO THE CERTIFICATE
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserFailure) {
          return CustomErrorWidget(text: state.errMessage);
        } else if (state is UserSuccess) {
          if (userCertificates.isEmpty) {
            return  CustomEmptyStateWidget(
                title: 'لا يوجد لديك شهادات حتى الان',
                subTitle: 'سوف تكتسبهم يا بطل ',
                image: SvgPicture.asset('lib/assets/icons/profile-empty-state.svg'));
          }
          return ListView.builder(
            itemCount: userCertificates.length,
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            itemBuilder: (context, index) {
              var userCertificate = userCertificates[index];
              return ProfileCard(
                title: 'علوم الحاسب',
                subTitle: "التوجه: للمبتدئيين",
                image:
                    'https://media.istockphoto.com/id/995322748/vector/certificate-template-in-elegant-blue-color-with-medal-and-abstract-borders-frames-certificate.jpg?s=612x612&w=0&k=20&c=7xltUIsl2P5X_HNbyhZzkZYW8R4-rBRXJt7cIc58Pks=',
                leftWidget: Text('تاريخ الحصول:${userCertificate}',
                    style: Styles.style12(context).copyWith(
                        color: Theme.of(context).colorScheme.secondary)),
                rightWidget: CustomIconButton(
                  title: 'تحميل',
                  onPressed: () {},
                  width: 120,
                  height: 35,
                  icon: Icon(
                    Icons.downloading_outlined,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  textColor: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                  radius: 32,
                  color: Theme.of(context).colorScheme.primary,
                ),
              );
            },
          );
        }
        return const CustomCardListViewShimmer();
      },
    );
  }
}
