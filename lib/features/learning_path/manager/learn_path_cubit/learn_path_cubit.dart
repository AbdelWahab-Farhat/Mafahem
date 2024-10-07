import 'package:Basera/core/models/learn_path.dart';
import 'package:Basera/features/learning_path/data/learning_path_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'learn_path_state.dart';

class LearnPathCubit extends Cubit<LearnPathState> {
  List<LearnPath> learnPaths = [];
  LearnPathCubit() : super(LearnPathInitial());

  void fetchLearnPaths() async {
    emit(LearnPathLoading());
    var result = await LearningPathService(dio: GetIt.instance<Dio>()).fetchLearnPaths();
    result.fold(
        (failure) => emit(LearnPathFailure(errMessage: failure.message)),
        (items) {
          learnPaths = items;
          emit(LearnPathSuccess());
        });
  }
}
