import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/movie_repository.dart';
import '../../../core/errors/failure.dart';

class GetNowPlayingMoviesUsecase extends BaseUsecase<List<Movie>, Unit> {
  final MovieRepository baseMovieRepository;
  GetNowPlayingMoviesUsecase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(Unit parameters) async {
    return await baseMovieRepository.getNowPlayingMovies();
  }

}