import 'package:Mafaheem/features/search/manager/price_range_cubit/price_range_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';


class PriceRangeSection extends StatelessWidget {
  const PriceRangeSection({
    super.key,
    required this.priceRangeCubit,
  });

  final PriceRangeCubit priceRangeCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceRangeCubit, PriceRangeState>(
      builder: (context, state) {
        return SfRangeSlider(
          min: 100,
          max: 400,
          values: SfRangeValues(
              priceRangeCubit.startValue, priceRangeCubit.endValue),
          interval: 40,
          showTicks: true,
          showLabels: true,
          enableTooltip: true,
          stepSize: 1,
          trackShape: const SfTrackShape(),
          tooltipShape: const SfPaddleTooltipShape(),
          onChanged: priceRangeCubit.onValuesChange,
        );
      },
    );
  }
}
