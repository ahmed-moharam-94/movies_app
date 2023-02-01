
class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'bc78320b10037f3b555439a969ec2f8c';
  static const String nowPlayingMoviesPath = '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularMoviesPath = '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedPath = '$baseUrl/movie/top_rated?api_key=$apiKey';


  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path) => '$imageBaseUrl/$path';

  static String movieDetailsPath(int movieId) => '$baseUrl/movie/$movieId?api_key=$apiKey';

  static String recommendationsPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";



}