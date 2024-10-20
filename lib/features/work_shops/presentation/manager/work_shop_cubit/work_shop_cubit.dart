import 'package:Mafaheem/core/models/work_shop.dart';
import 'package:Mafaheem/features/work_shops/data/get_work_shops_service.dart';
import 'package:Mafaheem/features/work_shops/data/pick_work_shop_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'work_shop_state.dart';

class WorkShopCubit extends Cubit<WorkShopState> {
  List<WorkShop> workShops = [];

  WorkShopCubit() : super(WorkShopLoading()) {
    getWorkShops();
  }

  Future<void> getWorkShops() async {
    var result = await GetWorkShopsService.getWorkShops();
    result.fold(
          (l) => emit(WorkShopFailure(errMessage: l.message)),
          (workShops) {
        this.workShops = workShops;
        emit(WorkShopSuccess());
      },
    );
  }

  WorkShop getCoverWorkShop() {
    return PickWorkShopService.pickWorkShop(workShops);
  }
}