import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/presentation/bloc/movies_bloc/movies_events.dart';
import 'package:movies_app/movies/presentation/bloc/movies_bloc/movies_states.dart';

import '../../../domain/usecases/get_now_playing_movies_usecase.dart';
import '../../../domain/usecases/get_popular_movies_usecase.dart';
import '../../../domain/usecases/get_top_rated_movies_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;

  MoviesBloc(this.getNowPlayingMoviesUsecase, this.getPopularMoviesUsecase,
      this.getTopRatedMoviesUsecase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(getNowPlayingMovies);

    on<GetPopularMoviesEvent>(getPopularMovies);

    on<GetTopRatedMoviesEvent>(getTopRatedMovies);
  }

  FutureOr<void> getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
      final result = await getNowPlayingMoviesUsecase(unit);
      result.fold(
          (failure) => emit(state.copyWith(
              nowPlayingMoviesRequestState: RequestState.error,
              nowPlayingMoviesMessage: failure.message)),
          (movies) => emit(state.copyWith(
              nowPlayingMoviesRequestState: RequestState.loaded,
              nowPlayingMovies: movies)));
  }

  FutureOr<void> getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
      final result = await getPopularMoviesUsecase(unit);
      result.fold(
          (failure) => emit(state.copyWith(
              popularMoviesRequestState: RequestState.error,
              popularMoviesMessage: failure.message)),
          (movies) => emit(state.copyWith(
              popularMoviesRequestState: RequestState.loaded,
              popularMovies: movies)));
  }

  FutureOr<void> getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUsecase(unit);
    result.fold(
            (failure) => emit(state.copyWith(
            topRatedMoviesRequestState: RequestState.error,
            topRatedMoviesMessage: failure.message)),
            (movies) => emit(state.copyWith(
            topRatedMoviesRequestState: RequestState.loaded,
            topRatedMovies: movies)));
  }

}
