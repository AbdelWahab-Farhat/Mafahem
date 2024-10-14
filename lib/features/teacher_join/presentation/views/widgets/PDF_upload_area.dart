import 'package:Basera/features/teacher_join/presentation/manager/upload_pdf_cubit/upload_pdf_cubit.dart';
import 'package:Basera/features/teacher_join/presentation/views/widgets/upload_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class PDFUploadArea extends StatelessWidget {
  const PDFUploadArea({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadPdfCubit, UploadPdfState>(
      builder: (context, state) {
        if (state is UploadPdfSuccess) {
          return const UploadButton(title: 'تم التحميل بنجاح', icon: FontAwesomeIcons.check,);
        }
        else if (state is UploadPdfLoading) {
          return const UploadButton(title: ' تحميل...', icon: FontAwesomeIcons.personWalking,isDisabled: true,);
        }
        else if (state is UploadPdfFailure) {
          return const UploadButton(title: ' تحميل سيرتك الذاتية (PDF)', icon: FontAwesomeIcons.cloudArrowUp,);
        }
        return const UploadButton(title: ' تحميل سيرتك الذاتية (PDF)', icon: FontAwesomeIcons.cloudArrowUp,);
      },
    );
  }
}