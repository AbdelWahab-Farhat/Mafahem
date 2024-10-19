import 'package:Mafaheem/core/models/user.dart';
import 'package:Mafaheem/features/Auth/data/token_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'token_state.dart';

class TokenCubit extends Cubit<TokenState> {
  User? user;
  TokenCubit() : super(TokenInitial());

  Future<void> userAuthChangeState() async {
    emit(TokenLoading());
    var result = await TokenService().getUserByToken();
    result.fold(
        (message) => emit(TokenUnauthenticated()),
            (userObj) {
              user = userObj;
              emit(TokenAuthenticated());
            });
  }
}
