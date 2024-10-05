import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'toggle_profile_views_state.dart';

class ToggleProfileViewsCubit extends Cubit<ToggleProfileViewsState> {
  int activeIndex = 0;
  PageController controller = PageController();

  ToggleProfileViewsCubit() : super(ToggleProfileViewsInitial());

  // Method to toggle with animation
  void onToggle(int index) {
    activeIndex = index;

    // Animate to the selected page with a smooth transition
    controller.animateToPage(
      activeIndex,
      duration: const Duration(milliseconds: 500), // Animation duration
      curve: Curves.easeInOut, // Animation curve
    );
    emit(ToggleProfileViewsInitial());
  }
}
