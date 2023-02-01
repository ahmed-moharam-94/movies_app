import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import '../../../core/errors/failure.dart';
import '../entities/movie.dart';
import '../repository/movie_repository.dart';

class GetTopRatedMoviesUsecase extends BaseUsecase<List<Movie>, Unit> {
  final MovieRepository baseMovieRepository;
  GetTopRatedMoviesUsecase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(Unit parameters) async {
    return await baseMovieRepository.getTopRatedMovies();

  }}
