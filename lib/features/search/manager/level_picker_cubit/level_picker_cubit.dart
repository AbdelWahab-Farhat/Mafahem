import 'package:Mafaheem/features/search/data/level_type.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'level_picker_state.dart';

class LevelPickerCubit extends Cubit<LevelPickerState> {
  bool isBeginnerLevelSelected = false;
  bool isIntermediateLevelSelected = false;
  bool isAdvancedLevelSelected = false;
  List<String> selectedLevels = [];
  LevelPickerCubit() : super(LevelPickerInitial());


  void onPickLevel(bool selectedLevel ,LevelType levelType) {
    switch (levelType) {
      case LevelType.beginner:
        isBeginnerLevelSelected = selectedLevel;
        if (selectedLevels.contains('مبتدئ')){
          selectedLevels.remove('مبتدئ');
        }else{
          selectedLevels.add('مبتدئ');
        }
        break;
      case LevelType.intermediate:
        isIntermediateLevelSelected = selectedLevel;
        if (selectedLevels.contains('متوسط')){
          selectedLevels.remove('متوسط');
        }else{
          selectedLevels.add('متوسط');
        }
        break;
      case LevelType.advanced:
        isAdvancedLevelSelected = selectedLevel;
        if (selectedLevels.contains('متقدم')){
          selectedLevels.remove('متقدم');
        }else{
          selectedLevels.add('متقدم');
        }
        break;
    }
    emit(LevelPickerInitial());
  }

}
