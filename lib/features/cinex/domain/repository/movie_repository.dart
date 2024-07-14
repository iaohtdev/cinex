import 'package:cinex/core/model/movie_model.dart';
import 'package:cinex/provider/api_config.dart';
import 'package:cinex/features/cinex/data/network/dio_service.dart';

class MovieRepository {
  static Future<List<MovieModel>> fetchTopRatedMovies() async {
    List<MovieModel> lst = [];

    final reponse = await DioService().get(ApiConfig.topRated);

    for (var i in reponse.data['results']) {
      if (i['backdrop_path'] != null || i['poster_path'] != null)
        lst.add(MovieModel.fromJson(i));
    }

    return lst;
  }

  static Future<List<MovieModel>> fetchUpCommingMovies() async {
    List<MovieModel> lst = [];
    int page = 1;
    final now = DateTime.now();

    while (page <= 3) {
      final response = await DioService().get(
        ApiConfig.upcoming,
        queryParameters: {'page': page},
      );

      if (response.data['results'].isEmpty) {
        break;
      }

      for (var i in response.data['results']) {
        if (i['backdrop_path'] != null || i['poster_path'] != null) {
          final releaseDate = DateTime.parse(i['release_date']);
          if (releaseDate.isAfter(now)) {
            lst.add(MovieModel.fromJson(i));
          }
        }
      }

      page++;
    }

    return lst;
  }

  static Future<MovieModel?> fetchDetailMovie(int id) async {
    MovieModel? movie;

    final reponse = await DioService().get('${ApiConfig.movie}/$id');

    movie = MovieModel.fromJson(reponse.data);

    return movie;
  }

  static Future<List<MovieModel>> fetchSimilar(int id) async {
    List<MovieModel> movies = [];

    final response =
        await DioService().get('${ApiConfig.movie}/$id${ApiConfig.similar}');
    var results = response.data['results'];

    var filteredResults = results
        .where((i) => i['backdrop_path'] != null && i['poster_path'] != null)
        .take(9);

    for (var i in filteredResults) {
      movies.add(MovieModel.fromJson(i));
    }

    return movies;
  }

  static Future<Map<String, List<MovieModel>>> trending() async {
    final dioService = DioService();

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

  static Future<List<MovieModel>> trendingTVDay() async {
    List<MovieModel> movies = [];

    final reponse = await DioService().get(ApiConfig.trendingTvDay);
    for (var i in reponse.data['results']) {
      if (i['backdrop_path'] != null || i['poster_path'] != null)
        movies.add(MovieModel.fromJson(i));
    }
    return movies;
  }
}
