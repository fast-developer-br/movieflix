import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  final String error;
  const ServerFailure({this.error = 'Não foi possível conectar ao servidor'});
  @override
  List<Object> get props => [];
}

class NetworkInfoFailure extends Failure {
  @override
  List<Object> get props => [];
}
