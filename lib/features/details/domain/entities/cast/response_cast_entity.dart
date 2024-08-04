import 'package:equatable/equatable.dart';

import 'cast_entity.dart';

class ResponseCastEntity extends Equatable {
  final int id;
  final List<CastEntity> casts;

  const ResponseCastEntity({
    required this.id,
    required this.casts,
  });

  @override
  List<Object> get props => [id, casts];
}
