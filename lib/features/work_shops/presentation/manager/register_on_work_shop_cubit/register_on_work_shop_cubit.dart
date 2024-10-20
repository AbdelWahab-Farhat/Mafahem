import 'package:Mafaheem/core/models/work_shop.dart';
import 'package:Mafaheem/features/work_shops/data/register_on_work_shop_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_on_work_shop_state.dart';

class RegisterOnWorkShopCubit extends Cubit<RegisterOnWorkShopState> {
  final WorkShop workShop;
  RegisterOnWorkShopCubit(this.workShop) : super(RegisterOnWorkShopInit());

  Future<void> registerOnWorkShop() async {
    emit(RegisterOnWorkShopLoading());
    var result = await RegisterOnWorkShopService.registerOnWorkShop(workShop.id.toString());
    result.fold(
          (failure) => emit(RegisterOnWorkShopFailure(errMessage: failure.message)),
          (successMessage) {
        emit(RegisterOnWorkShopSuccess(successMessage: successMessage));
      },
    );
  }
}
