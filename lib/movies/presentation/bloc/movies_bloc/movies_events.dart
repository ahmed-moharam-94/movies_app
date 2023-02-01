
import 'package:equatable/equatable.dart';

class MoviesEvents extends Equatable {
  @override
  List<Object?> get props => [];

}

class GetNowPlayingMoviesEvent extends MoviesEvents {}
class GetPopularMoviesEvent extends MoviesEvents {}
class GetTopRatedMoviesEvent extends MoviesEvents {}