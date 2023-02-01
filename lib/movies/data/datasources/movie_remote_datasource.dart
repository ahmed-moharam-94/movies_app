import 'package:dio/dio.dart';
import 'package:movies_app/core/network/api_constants.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/data/models/recommendation_model.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import '../../../core/errors/error_message_model.dart';
import '../../../core/network/exceptions.dart';
import '../../domain/usecases/get_recommendations_usecase.dart';
import '../models/movie_details_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);

  Future<List<RecommendationModel>> getRecommendations(
      RecommendationParameters parameters);
}

class MoviesRemoteDataSourceImpl with MovieRemoteDataSource {
  final Dio dio;

  MoviesRemoteDataSourceImpl(this.dio);

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await dio.get(ApiConstants.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      List movies = response.data['results'];
      List<MovieModel> moviesModels =
          movies.map((movies) => MovieModel.fromJson(movies)).toList();
      return moviesModels;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await dio.get(ApiConstants.popularMoviesPath);
    if (response.statusCode == 200) {
      List movies = response.data['results'];
      List<MovieModel> moviesModels =
          movies.map((movies) => MovieModel.fromJson(movies)).toList();
      return moviesModels;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await dio.get(ApiConstants.topRatedPath);
    if (response.statusCode == 200) {
      List movies = response.data['results'];
      List<MovieModel> moviesModels =
          movies.map((movies) => MovieModel.fromJson(movies)).toList();
      return moviesModels;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final response =
        await dio.get(ApiConstants.movieDetailsPath(parameters.movieId));

    if (response.statusCode == 200) {
      final MovieDetailsModel movieDetailsModel =
          MovieDetailsModel.fromJson(response.data);
      return movieDetailsModel;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendations(
      RecommendationParameters parameters) async {
    final response = await dio.get(ApiConstants.recommendationsPath(parameters.id));
    if (response.statusCode == 200) {
      List recommendations = response.data['results'];
      List<RecommendationModel> recommendationsModels = recommendations
          .map((movies) => RecommendationModel.fromJson(movies))
          .toList();
      return recommendationsModels;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
