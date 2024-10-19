import 'package:Mafaheem/features/road_map/manager/road_map_cubit/road_map_cubit.dart';
import 'package:Mafaheem/features/road_map/views/widgets/road_map_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoadMapView extends StatelessWidget {
  const RoadMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RoadMapCubit(),
      child: const RoadMapViewBody(),
    );
  }
}
