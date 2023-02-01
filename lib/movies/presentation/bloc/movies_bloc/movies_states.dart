import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';

import '../../../domain/entities/movie.dart';

class MoviesState extends Equatable {
  // now playing movies
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingMoviesRequestState;
  final String nowPlayingMoviesMessage;

  // popular movies
  final List<Movie> popularMovies;
  final RequestState popularMoviesRequestState;
  final String popularMoviesMessage;

  // top rated movies
  final List<Movie> topRatedMovies;
  final RequestState topRatedMoviesRequestState;
  final String topRatedMoviesMessage;

  const MoviesState({
    // now playing movies
    this.nowPlayingMovies = const [],
    this.nowPlayingMoviesRequestState = RequestState.loading,
    this.nowPlayingMoviesMessage = '',
    // popular movies
    this.popularMovies = const [],
    this.popularMoviesRequestState = RequestState.loading,
    this.popularMoviesMessage = '',
    // top rated movies
    this.topRatedMovies = const [],
    this.topRatedMoviesRequestState = RequestState.loading,
    this.topRatedMoviesMessage = '',
  });

  MoviesState copyWith({
    // now playing movies
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingMoviesRequestState,
    String? nowPlayingMoviesMessage,
    // popular movies
    List<Movie>? popularMovies,
    RequestState? popularMoviesRequestState,
    String? popularMoviesMessage,
    // top rated movies
    List<Movie>? topRatedMovies,
    RequestState? topRatedMoviesRequestState,
    String? topRatedMoviesMessage,
  }) {
    return MoviesState(
      // now playing movies
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingMoviesRequestState:
      nowPlayingMoviesRequestState ?? this.nowPlayingMoviesRequestState,
      nowPlayingMoviesMessage:
      nowPlayingMoviesMessage ?? this.nowPlayingMoviesMessage,
      // popular movies
      popularMovies: popularMovies ?? this.popularMovies,
      popularMoviesRequestState:
      popularMoviesRequestState ?? this.popularMoviesRequestState,
      popularMoviesMessage: popularMoviesMessage ?? this.popularMoviesMessage,
      // top rated movies
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMoviesRequestState:
      topRatedMoviesRequestState ?? this.topRatedMoviesRequestState,
      topRatedMoviesMessage: topRatedMoviesMessage ??
          this.topRatedMoviesMessage,
    );
  }

  @override
  List<Object?> get props =>
      [
        nowPlayingMovies,
        nowPlayingMoviesRequestState,
        nowPlayingMoviesMessage,
        popularMovies,
        popularMoviesRequestState,
        popularMoviesMessage,
        topRatedMovies,
        topRatedMoviesRequestState,
        topRatedMoviesRequestState
      ];
}
