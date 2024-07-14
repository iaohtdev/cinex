import 'package:cinex/core/model/episode_model.dart';
import 'package:cinex/core/model/tv_model.dart';
import 'package:cinex/provider/api_config.dart';
import 'package:cinex/features/cinex/data/network/dio_service.dart';

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

  static Future<TVModel?> fetchDetailTV(int id) async {
    TVModel? movie;

    final reponse = await DioService().get('${ApiConfig.tv}/$id');

    movie = TVModel.fromJson(reponse.data);

    return movie;
  }

  static Future<EpisodeModel?> fetchEpisode(
      {required int id, required int seasonNumber}) async {
    EpisodeModel? episode;

    final reponse = await DioService().get(
      '${ApiConfig.tv}/$id/season/$seasonNumber',
      queryParameters: {'language': 'en_US'},
    );

    episode = EpisodeModel.fromJson(reponse.data);

    return episode;
  }

  static Future<List<TVModel>> fetchSimilar(int id) async {
    List<TVModel> movies = [];

    final response =
        await DioService().get('${ApiConfig.tv}/$id${ApiConfig.similar}');
    var results = response.data['results'];

    var filteredResults = results
        .where((i) => i['backdrop_path'] != null && i['poster_path'] != null)
        .take(9);

    for (var i in filteredResults) {
      movies.add(TVModel.fromJson(i));
    }

    return movies;
  }
}
