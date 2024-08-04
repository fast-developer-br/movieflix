import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';

import '../errors/failures.dart';

abstract class UseCase<Output, Input> {
  Future<Either<Failure, Output>> call({required Input params});
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
