import 'package:equatable/equatable.dart';

class CastEntity extends Equatable {
  final int id;
  final String department;
  final String name;
  final double popularity;
  final String? profilePath;
  final String character;

  const CastEntity({
    required this.id,
    required this.department,
    required this.name,
    required this.popularity,
    this.profilePath,
    required this.character,
  });

  @override
  List<Object> get props {
    return [
      id,
      department,
      name,
      popularity,
      profilePath!,
      character,
    ];
  }
}
