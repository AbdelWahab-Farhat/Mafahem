import 'package:Mafaheem/core/utility/styles.dart';
import 'package:Mafaheem/features/search/manager/category_picker_cubit/category_picker_cubit.dart';
import 'package:Mafaheem/features/search/manager/level_picker_cubit/level_picker_cubit.dart';
import 'package:Mafaheem/features/search/manager/price_range_cubit/price_range_cubit.dart';
import 'package:Mafaheem/features/search/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchField extends StatelessWidget {
  final String? hintText;
  final Widget? icon;
  final Function()? onTap;
  final bool isEnabled;
  final TextEditingController? controller;
  const CustomSearchField({
    super.key,
    this.hintText,
    this.icon,
    this.isEnabled = false,
    this.onTap,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 40,
        child: TextFormField(
          onChanged: (value) {
            context.read<SearchCubit>().onSearchChanged(priceRangeCubit: context.read<PriceRangeCubit>(),
                levelPickerCubit: context.read<LevelPickerCubit>(),
                categoryPickerCubit: context.read<CategoryPickerCubit>()
            );
          },
          controller: controller,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          enabled: isEnabled,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            hintText: hintText,
            hintStyle: Styles.style14(context)
                .copyWith(color: const Color(0xff4D616B)),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: Styles.setOutlinedBorder(context, radius: 16),
            disabledBorder: Styles.setOutlinedBorder(context, radius: 16),
            focusedBorder: Styles.setOutlinedBorder(context, width: 2 , radius: 16),
            suffixIcon:
                Container(margin: const EdgeInsets.only(left: 10), child: icon),
            suffixIconConstraints: const BoxConstraints(
              minHeight: 40,
              minWidth: 40,
            ),
          ),
        ),
      ),
    );
  }
}
