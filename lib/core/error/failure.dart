
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

class CancelledFailure extends Failure{
  CancelledFailure({required super.message});
}
class FirebaseFailure extends Failure{
  FirebaseFailure({required super.message});
}

class UnknownFailure extends Failure{
  UnknownFailure({required super.message});
}