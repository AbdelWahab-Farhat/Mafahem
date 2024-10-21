import 'package:Mafaheem/features/search/data/level_type.dart';
import 'package:Mafaheem/features/search/manager/level_picker_cubit/level_picker_cubit.dart';
import 'package:Mafaheem/features/search/views/widgets/custom_filter_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LevelPickerSection extends StatelessWidget {
  const LevelPickerSection({
    super.key,
    required this.levelPickerCubit,
  });

  final LevelPickerCubit levelPickerCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LevelPickerCubit, LevelPickerState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomFilterChip(
              label: 'مبتدئ',
              selected: levelPickerCubit.isBeginnerLevelSelected,
              onSelected: (selectedValue) {
                levelPickerCubit.onPickLevel(
                    selectedValue, LevelType.beginner);
              },
            ),
            CustomFilterChip(
              label: 'متوسط',
              selected: levelPickerCubit.isIntermediateLevelSelected,
              onSelected: (selectedValue) {
                levelPickerCubit.onPickLevel(
                    selectedValue, LevelType.intermediate);
              },
            ),
            CustomFilterChip(
              label: 'متقدم',
              selected: levelPickerCubit.isAdvancedLevelSelected,
              onSelected: (selectedValue) {
                levelPickerCubit.onPickLevel(
                    selectedValue, LevelType.advanced);
              },
            ),
          ],
        );
      },
    );
  }
}

