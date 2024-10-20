import 'package:Mafaheem/core/models/work_shop.dart';
import 'package:Mafaheem/features/work_shops/data/checking_registertion.dart';
import 'package:Mafaheem/features/work_shops/data/register_on_work_shop_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_on_work_shop_state.dart';

class RegisterOnWorkShopCubit extends Cubit<RegisterOnWorkShopState> {
  final WorkShop workShop;
  late final bool isUserRegistered;
  RegisterOnWorkShopCubit(this.workShop) : super(RegisterOnWorkShopInit()){
    checkingUserRegistration();
  }

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

  Future<void> checkingUserRegistration() async {
    emit(RegisterOnWorkShopLoading());
    var result = await CheckingRegistrationService.checkingRegistration(workShop.id.toString());
    isUserRegistered = result;
    emit(RegisterOnWorkShopInit());
  }
}
