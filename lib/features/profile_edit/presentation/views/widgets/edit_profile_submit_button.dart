import 'package:Mafaheem/core/utility/functions/navigate_functions.dart';
import 'package:Mafaheem/core/utility/functions/ui_functions.dart';
import 'package:Mafaheem/core/widgets/custom_filled_button.dart';
import 'package:Mafaheem/core/widgets/custom_loading_widget.dart';
import 'package:Mafaheem/features/profile_edit/presentation/manager/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileSubmitButton extends StatelessWidget {
  const EditProfileSubmitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileSuccess) {
          showCustomSnackBar(context, state.message);
          pop(context);
        }
        else if (state is EditProfileFailure) {
          showCustomSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is EditProfileLoading) {
          return const CustomLoadingWidget();
        }
        else {
          return CustomFilledButton(
          title: 'تأكيد',
          textColor: Theme.of(context).colorScheme.onPrimary,
          onPressed: () =>
              context.read<EditProfileCubit>().validateDataAndSubmit(),
        );
        }
      },
    );
  }
}
