import 'package:cinex/data/models/movie_model.dart';
import 'package:cinex/core/config/api_config.dart';
import 'package:cinex/di.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> fetchTopRatedMovies();
  Future<MovieModel?> fetchDetailMovie(int id);
  Future<List<MovieModel>> fetchSimilar(int id);
  Future<Map<String, List<MovieModel>>> trending();
  Future<List<MovieModel>> trendingTVDay();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  @override
  Future<List<MovieModel>> fetchTopRatedMovies() async {
    List<MovieModel> lst = [];

    final reponse = await dio.get(ApiConfig.topRated);

    for (var i in reponse.data['results']) {
      if (i['backdrop_path'] != null || i['poster_path'] != null)
        lst.add(MovieModel.fromJson(i));
    }

    return lst;
  }

  @override
  Future<MovieModel?> fetchDetailMovie(int id) async {
    MovieModel? movie;

    final reponse = await dio.get('${ApiConfig.movie}/$id');

    movie = MovieModel.fromJson(reponse.data);

    return movie;
  }

  @override
  Future<List<MovieModel>> fetchSimilar(int id) async {
    List<MovieModel> movies = [];

    final response =
        await dio.get('${ApiConfig.movie}/$id${ApiConfig.similar}');
    var results = response.data['results'];

    var filteredResults = results
        .where((i) => i['backdrop_path'] != null && i['poster_path'] != null)
        .take(9);

    for (var i in filteredResults) {
      movies.add(MovieModel.fromJson(i));
    }

    return movies;
  }

  @override
  Future<Map<String, List<MovieModel>>> trending() async {
    final dioService = dio;

    final responses = await Future.wait([
      dioService.get(ApiConfig.trendingDay),
      dioService.get(ApiConfig.trendingWeek),
    ]);

    List<MovieModel> trendingDays = (responses[0].data['results'] as List)
        .map((item) => MovieModel.fromJson(item))
        .toList();
    List<MovieModel> trendingWeeks = (responses[1].data['results'] as List)
        .map((item) => MovieModel.fromJson(item))
        .toList();

    return {
      'day': trendingDays,
      'week': trendingWeeks,
    };
  }

  @override
  Future<List<MovieModel>> trendingTVDay() async {
    List<MovieModel> movies = [];

    final reponse = await dio.get(ApiConfig.trendingTvDay);
    for (var i in reponse.data['results']) {
      if (i['backdrop_path'] != null || i['poster_path'] != null)
        movies.add(MovieModel.fromJson(i));
    }
    return movies;
  }
}
