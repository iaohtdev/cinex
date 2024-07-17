import 'package:cinex/core/config/api_config.dart';
import 'package:cinex/data/models/movie_model.dart';
import 'package:cinex/di.dart';

abstract class DiscoverRemoteDataSource {
  Future<List<MovieModel>> discover(
      {int? genre, String? sortBy, String? originalLanguage});
}

class DiscoverRemoteDataSourceImpl implements DiscoverRemoteDataSource {
  @override
  Future<List<MovieModel>> discover(
      {int? genre, String? sortBy, String? originalLanguage}) async {
    List<MovieModel> movies = [];

    final reponse = await dio.get(ApiConfig.disover, queryParameters: {
      'with_genres': genre,
      'sort_by': sortBy,
      'with_original_language': originalLanguage
    });
    for (var i in reponse.data['results']) {
      if (i['backdrop_path'] != null && i['poster_path'] != null)
        movies.add(MovieModel.fromJson(i));
    }
    return movies;
  }
}
