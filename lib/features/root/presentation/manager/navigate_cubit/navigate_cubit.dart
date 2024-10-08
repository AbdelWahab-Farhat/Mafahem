import 'package:Basera/features/home/presentation/views/home_view.dart';
import 'package:Basera/features/road_map/views/road_map_view.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta/meta.dart';

part 'navigate_state.dart';

class NavigateCubit extends Cubit<NavigateState> {
  int currentIndex = 0;
  final NotchBottomBarController notchBottomBarController = NotchBottomBarController();
  List<Widget> views = [
    HomeView(),
    HomeView(),
    RoadMapView(),
    HomeView(),

  ];
  NavigateCubit() : super(NavigateInitial());

  navigateTo(int index) {
    currentIndex = index;
    emit(NavigateInitial());
  }


  List<BottomBarItem> items (BuildContext context){
    return [
      BottomBarItem(
        inActiveItem: SvgPicture.asset('lib/assets/icons/home-nav.svg',color: Theme.of(context).colorScheme.secondary,), // Inactive state
        activeItem: SvgPicture.asset('lib/assets/icons/home-nav.svg',color: Theme.of(context).colorScheme.primary,),
        itemLabel: "Home",
      ),
      BottomBarItem(
        inActiveItem: SvgPicture.asset('lib/assets/icons/my-courses-nav.svg',color: Theme.of(context).colorScheme.secondary,), // Inactive state
        activeItem: SvgPicture.asset('lib/assets/icons/my-courses-nav.svg',color: Theme.of(context).colorScheme.primary,),
        itemLabel: "MY COURSES",
      ),
      BottomBarItem(
        inActiveItem: SvgPicture.asset('lib/assets/icons/private-lessons-nav.svg',color: Theme.of(context).colorScheme.secondary,), // Inactive state
        activeItem: SvgPicture.asset('lib/assets/icons/private-lessons-nav.svg',color: Theme.of(context).colorScheme.primary,),
        itemLabel: "PRIVATE LESSONS",
      ),
      BottomBarItem(
        inActiveItem: SvgPicture.asset('lib/assets/icons/category-nav.svg',color: Theme.of(context).colorScheme.secondary,), // Inactive state
        activeItem: SvgPicture.asset('lib/assets/icons/category-nav.svg',color: Theme.of(context).colorScheme.primary,),
        itemLabel: "CATEGORIES",
      ),
    ];
  }
}
