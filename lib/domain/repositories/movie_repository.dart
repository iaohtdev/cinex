import 'package:cinex/data/models/movie_model.dart';

abstract class MovieRepository {
  Future<List<MovieModel>> fetchTopRatedMovies();
  Future<MovieModel?> fetchDetailMovie(int id);
  Future<List<MovieModel>> fetchSimilar(int id);
  Future<Map<String, List<MovieModel>>> trending();
  Future<List<MovieModel>> trendingTVDay();
}
