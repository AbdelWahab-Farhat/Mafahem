import 'package:Basera/features/teacher_join/presentation/manager/collect_data_cubit/collect_data_cubit.dart';
import 'package:Basera/features/teacher_join/presentation/manager/upload_pdf_cubit/upload_pdf_cubit.dart';
import 'package:Basera/features/teacher_join/presentation/views/teacher_join_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeacherJoinView extends StatelessWidget {
  const TeacherJoinView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UploadPdfCubit(),
        ),
        BlocProvider(
          create: (context) => CollectDataCubit(),
        ),
      ],
      child: const TeacherJoinViewBody(),
    );
  }
}
