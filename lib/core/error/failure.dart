
abstract class Failure{
  final String message;
  Failure({required this.message});
}


class ServerFailure extends Failure{
  ServerFailure({required super.message});
}
class RestPasswordFailure extends Failure{
  RestPasswordFailure({required super.message});
}