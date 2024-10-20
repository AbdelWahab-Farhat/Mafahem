import 'package:Mafaheem/core/models/work_shop.dart';
import 'package:Mafaheem/features/work_shops/data/get_work_shops_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'work_shop_detail_state.dart';

class WorkShopDetailCubit extends Cubit<WorkShopDetailState> {
  late final List<WorkShop> workShops;
  WorkShopDetailCubit() : super(WorkShopDetailLoading()){
    getRelatedWorkShops();
  }


  Future<void> getRelatedWorkShops() async {
    // TODO CHANGE THE METHOD TO RELATED WORKSHOPS LATER FORM API ...
    var result = await GetWorkShopsService.getWorkShops();
    result.fold(
          (l) => emit(WorkShopDetailFailure(errMessage: l.message)),
          (workShops) {
        this.workShops = workShops;
        emit(WorkShopDetailSuccess());
      },
    );
  }
}
