import 'package:Mafaheem/core/utility/functions/validate_functions.dart';
import 'package:Mafaheem/core/widgets/custom_app_bar.dart';
import 'package:Mafaheem/core/widgets/custom_textfield.dart';
import 'package:Mafaheem/features/teacher_join/presentation/manager/collect_data_cubit/collect_data_cubit.dart';
import 'package:Mafaheem/features/teacher_join/presentation/views/widgets/PDF_upload_area.dart';
import 'package:Mafaheem/features/teacher_join/presentation/views/widgets/send_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TeacherJoinViewBody extends StatelessWidget {
  const TeacherJoinViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var collectDataCubit = context.read<CollectDataCubit>();
    return Scaffold(
      appBar: const CustomAppBar(title: 'انضم الينا'),
      body: Form(
        key: collectDataCubit.formKey,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 36),
          children: [
            SvgPicture.asset(
              'lib/assets/icons/logo.svg',
              height: 80,
            ),
             CustomTextField(
              label: 'الاسم الكامل',
              onSaved: (value) =>collectDataCubit.name = value!,
               validator: validateUsername,
            ),
            const SizedBox(
              height: 16,
            ),
             CustomTextField(
              label: 'البريد الالكتروني',
              validator: validateEmail,
              onSaved: (value) =>collectDataCubit.email = value!,
             ),
            const SizedBox(
              height: 16,
            ),
             CustomTextField(
              label: 'رقم الهاتف',
               keyboardType: TextInputType.phone,
               validator: validateLibyanPhoneNumber,
               onSaved: (value) =>collectDataCubit.phone = value!,
             ),
            const SizedBox(
              height: 16,
            ),
             CustomTextField(
              validator: validateMultiLineInput,
              onSaved: (value) => collectDataCubit.personalInfo = value!,
              label: 'ما الذي يؤهلك',
              maxLines: 6,
            ),
            const SizedBox(
              height: 36,
            ),
            const PDFUploadArea(),
            const SizedBox(height: 24,),
            const SendButton()
          ],
        ),
      ),
    );
  }
}
