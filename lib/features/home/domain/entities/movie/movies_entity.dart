import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class MovieEntity extends Equatable {
  final int id;
  final String backdropPath;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final double voteAverage;
  final int voteCount;

  const MovieEntity({
    required this.id,
    required this.backdropPath,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  int get rating => (voteAverage * 10).toInt();

  String get releaseDateFormatted =>
      DateFormat("d 'de' MMMM 'de' y", 'pt-BR').format(releaseDate);

  @override
  List<Object> get props {
    return [
      id,
      backdropPath,
      overview,
      popularity,
      posterPath,
      releaseDate,
      title,
      voteAverage,
      voteCount,
    ];
  }
}
