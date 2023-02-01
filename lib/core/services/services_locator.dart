import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/movies/data/datasources/movie_remote_datasource.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/bloc/movies_bloc/movies_bloc.dart';

import '../../movies/domain/repository/movie_repository.dart';
import '../../movies/domain/usecases/get_recommendations_usecase.dart';
import '../../movies/presentation/bloc/movie_details_bloc/movie_details_bloc.dart';

final sl = GetIt.instance;
class ServicesLocator {

  void init() {
    // Dio (singleton)
    sl.registerLazySingleton(() => Dio());

    // Data Sources (singleton)
    sl.registerLazySingleton<MovieRemoteDataSource>(() => MoviesRemoteDataSourceImpl(sl()));

    // Repositories (singleton)
    sl.registerLazySingleton<MovieRepository>(() => MoviesRepositoryImpl(remoteDataSource: sl()));

    // Use cases (singleton)
    sl.registerLazySingleton(() => GetNowPlayingMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUsecase(sl()));
    sl.registerLazySingleton(() => GetRecommendationsUseCase(sl()));

    // BloCs (factory)
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));
  }
}