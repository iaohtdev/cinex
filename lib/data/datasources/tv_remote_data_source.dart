import 'package:cinex/data/models/episode_model.dart';
import 'package:cinex/data/models/tv_model.dart';

import 'package:cinex/core/config/api_config.dart';
import 'package:cinex/di.dart';

abstract class TVRemoteDataSource {
  Future<List<TVModel>> trendingTVDay();
  Future<TVModel?> fetchDetailTV(int id);
  Future<EpisodeModel?> fetchEpisode(
      {required int id, required int seasonNumber});
  Future<List<TVModel>> fetchSimilar(int id);
}

class TVRemoteDataSourceImpl implements TVRemoteDataSource {
  @override
  Future<List<TVModel>> trendingTVDay() async {
    List<TVModel> movies = [];

    final reponse = await dio.get(ApiConfig.trendingTvDay);
    for (var i in reponse.data['results']) {
      if (i['backdrop_path'] != null || i['poster_path'] != null)
        movies.add(TVModel.fromJson(i));
    }
    return movies;
  }

  @override
  Future<TVModel?> fetchDetailTV(int id) async {
    TVModel? movie;

    final reponse = await dio.get('${ApiConfig.tv}/$id');

    movie = TVModel.fromJson(reponse.data);

    return movie;
  }

  @override
  Future<EpisodeModel?> fetchEpisode(
      {required int id, required int seasonNumber}) async {
    EpisodeModel? episode;

    final reponse = await dio.get(
      '${ApiConfig.tv}/$id/season/$seasonNumber',
      queryParameters: {'language': 'en_US'},
    );

    episode = EpisodeModel.fromJson(reponse.data);

    return episode;
  }

  @override
  Future<List<TVModel>> fetchSimilar(int id) async {
    List<TVModel> movies = [];

    final response = await dio.get('${ApiConfig.tv}/$id${ApiConfig.similar}');
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
