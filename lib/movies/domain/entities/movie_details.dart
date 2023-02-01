import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/genre.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final int id;
  final List<Genre> genres;
  final String overview;
  final String releaseDate;
  final String title;
  final double voteAverage;
  final int runtime;

  const MovieDetails({
    required this.backdropPath,
    required this.id,
    required this.genres,
    required this.overview,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.runtime,
  });

  @override
  List<Object> get props => [
        backdropPath,
        id,
        genres,
        overview,
        releaseDate,
        title,
        voteAverage,
        runtime,
      ];
}
