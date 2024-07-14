import 'package:cinex/core/model/models.dart';
import 'package:cinex/provider/api_config.dart';
import 'package:cinex/features/cinex/data/network/dio_service.dart';

class GenresRepository {
  static Future<List<GenreModel>> fetchNowPlayingMovies() async {
    List<GenreModel> lst = [];

    final reponse = await DioService().get(ApiConfig.genre);

    for (var i in reponse.data['genres']) {
      if (lst.length <= 6) {
        lst.add(GenreModel.fromJson(i));
      }
    }

    return lst;
  }
}
