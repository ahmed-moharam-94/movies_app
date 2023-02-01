import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';

import '../repository/movie_repository.dart';

class GetRecommendationsUseCase extends BaseUsecase<List<Recommendation>, RecommendationParameters > {
  final MovieRepository movieRepository;
  GetRecommendationsUseCase(this.movieRepository);
  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameters) async {
    return await movieRepository.getRecommendations(parameters);
  }



}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters({required this.id});

  @override
  List<Object> get props => [id];
}