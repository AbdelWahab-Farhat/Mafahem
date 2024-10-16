import 'package:Basera/core/models/coupon.dart';
import 'package:Basera/features/cart/data/coupon_service.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'coupon_state.dart';

class CouponCubit extends Cubit<CouponState> {
  final TextEditingController couponCodeController = TextEditingController();
  Coupon? coupon;
  CouponCubit() : super(CouponInitial());

  void applyCoupon() async {
    if (couponCodeController.text.isNotEmpty) {
      emit(CouponLoading());
      var result =
          await CouponService.applyCoupon(couponCodeController.text.trim());
      result.fold(
        (l) => emit(CouponFailure(errMessage: l.message)),
        (r) {
          coupon = r;
          emit(CouponSuccess(couponMessage: 'تمت الاضافة بنجاح'));
        },
      );
    }
  }
}
