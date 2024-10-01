import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'scroll_state.dart';

class ScrollCubit extends Cubit<ScrollState> {
  final ScrollController scrollController = ScrollController();

  ScrollCubit() : super(ScrollAtTop()) {
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.position.pixels == 0) {
      emit(ScrollAtTop());
    } else if (scrollController.position.pixels >= scrollController.position.maxScrollExtent) {
      emit(ScrollAtBottom());
    } else {
      emit(ScrollOnChange());
    }
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void scrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
