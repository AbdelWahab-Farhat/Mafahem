import 'package:Basera/core/models/road_map.dart';
import 'package:Basera/core/widgets/custom_error_widget.dart';
import 'package:Basera/core/widgets/custom_loading_widget.dart';
import 'package:Basera/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:Basera/features/road_map/manager/road_map_cubit/road_map_cubit.dart';
import 'package:Basera/features/road_map/views/widgets/road_map_item.dart';
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
          List<RoadMap> roadMaps = roadMapCubit.roadMaps;
          if (state is RoadMapFailure) {
            return CustomErrorWidget(text: state.errMessage,);
          }
          else if (state is RoadMapSuccess) {
            return ListView.builder(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              itemCount: roadMaps.length,
              itemBuilder: (context, index) {
                return RoadMapItem(roadMap: roadMaps[index],);
              },
            );
          }
          return const CustomLoadingWidget();
        },
      ),
    );
  }
}




