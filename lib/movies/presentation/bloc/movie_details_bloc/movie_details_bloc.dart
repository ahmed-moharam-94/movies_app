import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';

import '../../../domain/entities/recommendation.dart';
import '../../../domain/usecases/get_movie_details_usecase.dart';
import '../../../domain/usecases/get_recommendations_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailState> {
  final GetMovieDetailsUsecase getMovieDetailsUseCase;
  final GetRecommendationsUseCase getRecommendationsUseCase;

  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationsUseCase)
      : super(const MovieDetailState()) {
    on<GetMovieDetailsEvent>(_getMovieDetailsEvent);
    on<GetMovieRecommendations>(_getMovieRecommendations);
  }

  FutureOr<void> _getMovieDetailsEvent(
      GetMovieDetailsEvent event, Emitter<MovieDetailState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));
    result.fold(
        (failure) => emit(state.copyWith(
            movieDetailsRequestState: RequestState.error,
            movieDetailsMessage: failure.message)),
        (movieDetails) => emit(state.copyWith(
            movieDetailsRequestState: RequestState.loaded,
            movieDetails: movieDetails)));
  }

  FutureOr<void> _getMovieRecommendations(
      GetMovieRecommendations event, Emitter<MovieDetailState> emit) async {
    final result =
        await getRecommendationsUseCase(RecommendationParameters(id: event.id));
    result.fold(
        (failure) => emit(state.copyWith(
            recommendationsRequestState: RequestState.error,
            recommendationsMessage: failure.message)),
        (recommendations) => emit(state.copyWith(
            recommendationsRequestState: RequestState.loaded,
            recommendations: recommendations)));
  }
}
