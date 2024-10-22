import 'package:Mafaheem/core/models/coupon.dart';
import 'package:Mafaheem/core/models/road_map.dart';
import 'package:Mafaheem/features/payment/data/create_order_service.dart';
import 'package:Mafaheem/features/payment/data/create_roadmap_order_service.dart';
import 'package:Mafaheem/features/payment/data/payment_item_type.dart';
import 'package:Mafaheem/features/payment/data/payment_method.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentMethod paymentMethod = PaymentMethod.sadad;
  final double totalPrice;
  Coupon? coupon;
  final RoadMap? roadMap;
  final PaymentItemType paymentItemType;

  PaymentCubit(this.coupon, this.roadMap, {required this.paymentItemType, required this.totalPrice})
      : super(PaymentInitial());

  void selectPaymentMethod(PaymentMethod method) {
    paymentMethod = method;
    emit(PaymentInitial());
  }

  void confirmPayment() async {
    emit(PaymentLoading());
    if (paymentItemType == PaymentItemType.roadMap) {
      var result = await CreateRoadmapOrderService.createRoadmapOrder(roadMap!);
      result.fold(
        (failure) {
          emit(PaymentFailure(errMessage: failure.message));
        },
        (message) {
          emit(PaymentSuccess(paymentMessage: message));
        },
      );
    } else if (paymentItemType == PaymentItemType.courses) {
      var result = await CreateOrderService.createOrder(coupon);
      result.fold(
        (failure) {
          emit(PaymentFailure(errMessage: failure.message));
        },
        (message) {
          emit(PaymentSuccess(paymentMessage: message));
        },
      );
    }
  }
}
