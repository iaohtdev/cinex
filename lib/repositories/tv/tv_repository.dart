import 'package:cinex/model/tv_model.dart';
import 'package:cinex/provider/api_config.dart';
import 'package:cinex/service/dio_service.dart';

class TVRepository {
  static Future<List<TVModel>> trendingTVDay() async {
    List<TVModel> movies = [];

    final reponse = await DioService().get(ApiConfig.trendingTvDay);
    for (var i in reponse.data['results']) {
      if (i['backdrop_path'] != null || i['poster_path'] != null)
        movies.add(TVModel.fromJson(i));
    }
    return movies;
  }
}
