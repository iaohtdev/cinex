import 'package:cinex/model/models.dart';
import 'package:cinex/provider/api_config.dart';
import 'package:cinex/service/dio_service.dart';

class DiscoverRepository {
  static Future<List<MovieModel>> discover({int? genre}) async {
    List<MovieModel> movies = [];

    final reponse = await DioService()
        .get(ApiConfig.disover, queryParameters: {'with_genres': genre});
    for (var i in reponse.data['results']) {
      movies.add(MovieModel.fromJson(i));
    }
    return movies;
  }
}
