import 'package:cinex/core/model/models.dart';
import 'package:cinex/di.dart';
import 'package:cinex/provider/api_config.dart';

class DiscoverRepository {
  static Future<List<MovieModel>> discover(
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
