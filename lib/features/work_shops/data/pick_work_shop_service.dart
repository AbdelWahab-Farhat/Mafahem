


import 'package:Mafaheem/core/models/work_shop.dart';

class PickWorkShopService {

  static pickWorkShop(List<WorkShop> workShops) {
    workShops.shuffle();
    return workShops.first;
  }
}
