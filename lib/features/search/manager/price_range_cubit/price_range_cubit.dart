import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

part 'price_range_state.dart';

class PriceRangeCubit extends Cubit<PriceRangeState> {
  double startValue = 100;
  double endValue = 400;

  PriceRangeCubit() : super(PriceRangeInitial());

  void onValuesChange(SfRangeValues rangeValues) {
      startValue = rangeValues.start;
      endValue = rangeValues.end;
      emit(PriceRangeInitial());
  }
}
