import 'package:movieflix/features/details/domain/entities/cast/cast_entity.dart';

class CastModel extends CastEntity {
  const CastModel(
      {required super.id,
      required super.department,
      required super.name,
      required super.popularity,
      required super.profilePath,
      required super.character});

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
        id: json['id'],
        department: json['known_for_department'],
        name: json['name'],
        popularity: json['popularity'],
        profilePath: json['profile_path'],
        character: json['character']);
  }
}
