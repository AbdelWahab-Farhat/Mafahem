import 'package:Mafaheem/core/models/cart.dart';
import 'package:Mafaheem/features/cart/data/bill_service.dart';
import 'package:Mafaheem/features/cart/data/get_user_cart_service.dart';
import 'package:Mafaheem/features/cart/data/remove_from_user_cart_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  Cart? cart;
  CartCubit() : super(CartInitial());

  Future<void> getUserCart() async {
    emit(CartLoading());
    var result = await GetUserCartService.getUserCart();
    result.fold(
      (l) => emit(CartFailure(errMessage: l.message)),
      (r) {
        cart = r;
        emit(CartSuccess());
      },
    );
  }
  int numberOfCourses() {
    return BillService.numberOfCourses(cart?.courses ?? []);
  }

  double totalPrice() {
    return BillService.totalPrice(cart?.courses! ?? []);
  }

  double discountedPrice(double couponDiscountPrice) {
    return BillService.discountedPrice(totalPrice(), couponDiscountPrice);
  }

  Future<void> removeFromCart(String courseID) async {
    var result = await RemoveFromUserCartService.removeFromCart(courseID);
    result.fold(
      (l) => emit(CartFailure(errMessage: l.message)),
      (r) {
        cart!.courses!.removeWhere((element) => element.id.toString() == courseID);
        emit(CartSuccess());
      },
    );
  }


}
