import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';


// TODO: COMPLETE IT AND ADD PAYMENT'S
class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());
}
