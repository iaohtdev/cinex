import 'package:cinex/model/movie_model.dart';
import 'package:cinex/provider/api_config.dart';
import 'package:cinex/service/dio_service.dart';

class MovieRepository {
  static Future<List<MovieModel>> fetchNowPlayingMovies() async {
    List<MovieModel> lst = [];

    final reponse = await DioService().get(ApiConfig.nowPlaying);

    for (var i in reponse.data['results']) {
      lst.add(MovieModel.fromJson(i));
    }

    return lst;
  }

  static Future<List<MovieModel>> fetchUpCommingMovies() async {
    List<MovieModel> lst = [];

    final reponse = await DioService().get(ApiConfig.upcoming);

    for (var i in reponse.data['results']) {
      lst.add(MovieModel.fromJson(i));
    }

    return lst;
  }

  static Future<MovieModel?> fetchDetailMovie(int id) async {
    MovieModel? movie;

    final reponse = await DioService().get('${ApiConfig.movie}/$id');

    movie = MovieModel.fromJson(reponse.data);

    return movie;
  }

  static Future<List<MovieModel>> fetchRecommendMovie(int id) async {
    List<MovieModel> movies = [];

    final reponse = await DioService()
        .get('${ApiConfig.movie}/$id${ApiConfig.recommendations}');
    for (var i in reponse.data['results']) {
      movies.add(MovieModel.fromJson(i));
    }
    return movies;
  }
}
