
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/repository/movie_repository.dart';

import '../entities/movie_details.dart';

class GetMovieDetailsUsecase extends BaseUsecase<MovieDetails, MovieDetailsParameters> {
  final MovieRepository movieRepository;
  GetMovieDetailsUsecase(this.movieRepository);
  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParameters parameters) async  {
      return await movieRepository.getMovieDetails(parameters);
  }

}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}