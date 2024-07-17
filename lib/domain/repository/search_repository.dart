import 'package:cinex/core/model/models.dart';
import 'package:cinex/data/config/api_config.dart';
import 'package:cinex/utils/enum/media_type.dart';
import 'package:cinex/di.dart';

class SearchRepository {
  static Future<Map<String, dynamic>> search({String? query}) async {
    List<MovieModel> movies = [];
    List<CastModel> casts = [];
    List<MovieModel> tv = [];

    final response =
        await dio.get(ApiConfig.searchMutil, queryParameters: {'query': query});

    for (var item in response.data['results']) {
      if (item['media_type'] == MediaType.person.name) {
        if (item['profile_path'] != null) casts.add(CastModel.fromJson(item));
      } else if (item['media_type'] == MediaType.tv.name) {
        if (item['backdrop_path'] != null || item['poster_path'] != null)
          tv.add(MovieModel.fromJson(item));
      } else {
        if (item['backdrop_path'] != null || item['poster_path'] != null)
          movies.add(MovieModel.fromJson(item));
      }
    }

    return {'movies': movies, 'casts': casts, 'tv': tv};
  }
}
