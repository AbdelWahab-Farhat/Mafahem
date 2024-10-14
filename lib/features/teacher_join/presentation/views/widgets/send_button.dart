import 'package:Basera/core/utility/functions/navigate_functions.dart';
import 'package:Basera/core/utility/functions/ui_functions.dart';
import 'package:Basera/core/widgets/custom_filled_button.dart';
import 'package:Basera/core/widgets/custom_loading_widget.dart';
import 'package:Basera/features/setting/presentation/views/setting_view.dart';
import 'package:Basera/features/teacher_join/presentation/manager/collect_data_cubit/collect_data_cubit.dart';
import 'package:Basera/features/teacher_join/presentation/manager/upload_pdf_cubit/upload_pdf_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//TODO: PLEASE TRY IT (NO TEST FOR NOW)
class SendButton extends StatelessWidget {
  const SendButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var uploadPdfCubit = context.read<UploadPdfCubit>();
    return BlocConsumer<CollectDataCubit, CollectDataState>(
      listener: (context, state) {
        if (state is CollectDataSendingSuccess) {
          showCustomDialog(context: context, title: 'نجاح', description: state.successMessage, image: 'lib/assets/animation/success.json',
          onConfirm: () => pushAndRemoveUntil(context,const SettingView()),);
        }
        else if (state is CollectDataSendingFailure) {
          showCustomSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is CollectDataSending) {
          return const CustomLoadingWidget();
        }
        return CustomFilledButton(
          title: 'ارسال',
          textColor: Theme.of(context).colorScheme.onPrimary,
          onPressed: () => context
              .read<CollectDataCubit>()
              .submitAndSend(uploadPdfCubit.file),
        );
      },
    );
  }
}
