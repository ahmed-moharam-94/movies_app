part of 'movie_details_bloc.dart';

class MovieDetailState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsRequestState;
  final String movieDetailsMessage;

  final List<Recommendation> recommendations;
  final RequestState recommendationsRequestState;
  final String recommendationsMessage;

  const MovieDetailState({
    this.movieDetails,
    this.movieDetailsRequestState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.recommendations = const [],
    this.recommendationsRequestState = RequestState.loading,
    this.recommendationsMessage = '',
  });

  MovieDetailState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsRequestState,
    String? movieDetailsMessage,
    List<Recommendation>? recommendations = const [],
    RequestState? recommendationsRequestState = RequestState.loading,
    String? recommendationsMessage = '',
  }) {
    return MovieDetailState(
        movieDetails: movieDetails ?? this.movieDetails,
        movieDetailsRequestState:
            movieDetailsRequestState ?? this.movieDetailsRequestState,
        movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
        recommendations: recommendations ?? this.recommendations,
        recommendationsRequestState:
            recommendationsRequestState ?? this.recommendationsRequestState,
        recommendationsMessage:
            recommendationsMessage ?? this.recommendationsMessage);
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsRequestState,
        movieDetailsMessage,
        recommendations,
        recommendationsRequestState,
        recommendationsMessage,
      ];
}
