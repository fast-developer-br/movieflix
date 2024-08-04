import 'package:movieflix/features/details/data/models/cast/cast_model.dart';
import 'package:movieflix/features/details/domain/entities/cast/response_cast_entity.dart';

class ResponseCastModel extends ResponseCastEntity {
  const ResponseCastModel({required super.id, required super.casts});

  factory ResponseCastModel.fromJson(Map<String, dynamic> json) {
    return ResponseCastModel(
      id: json['id'],
      casts: List<CastModel>.from(
        (json['cast']).map<CastModel>(
          (x) => CastModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
