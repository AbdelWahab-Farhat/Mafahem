import 'dart:developer';

import 'package:Mafaheem/core/models/road_map.dart';
import 'package:Mafaheem/core/widgets/custom_error_widget.dart';
import 'package:Mafaheem/core/widgets/custom_filled_button.dart';
import 'package:Mafaheem/core/widgets/custom_loading_widget.dart';
import 'package:Mafaheem/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:Mafaheem/features/road_map/manager/road_map_cubit/road_map_cubit.dart';
import 'package:Mafaheem/features/road_map/views/widgets/road_map_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoadMapViewBody extends StatefulWidget {
  const RoadMapViewBody({super.key});

  @override
  State<RoadMapViewBody> createState() => _RoadMapViewBodyState();
}

class _RoadMapViewBodyState extends State<RoadMapViewBody> {
  @override
  void initState() {
    context.read<RoadMapCubit>().fetchRoadMaps();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var roadMapCubit = context.read<RoadMapCubit>();
    return Scaffold(
      appBar: const HomeAppBar(),
      body: BlocBuilder<RoadMapCubit, RoadMapState>(
        builder: (context, state) {
          if (state is RoadMapFailure) {
            return CustomErrorWidget(
              text: state.errMessage,
            );
          } else if (state is RoadMapSuccess) {
            List<RoadMap> roadMaps = roadMapCubit.roadMaps;
            log(roadMaps.length.toString());
            return ListView.builder(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              itemCount: roadMaps.length,
              itemBuilder: (context, index) {
                return RoadMapItem(
                  roadMap: roadMaps[index],
                );
              },
            );
          }
          // TODO: CHANGE IT TO SHIMMER LATER
          return const CustomLoadingWidget();
        },
      ),
    );
  }
}


