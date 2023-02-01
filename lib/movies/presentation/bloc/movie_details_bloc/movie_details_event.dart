part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;

  GetMovieDetailsEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class GetMovieRecommendations extends MovieDetailsEvent {
  final int id;

  GetMovieRecommendations({required this.id});

  @override
  List<Object> get props => [id];
}
