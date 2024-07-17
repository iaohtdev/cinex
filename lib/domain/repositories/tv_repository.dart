import 'package:cinex/data/models/episode_model.dart';
import 'package:cinex/data/models/tv_model.dart';

abstract class TVRepository {
  Future<List<TVModel>> trendingTVDay();
  Future<TVModel?> fetchDetailTV(int id);
  Future<EpisodeModel?> fetchEpisode(
      {required int id, required int seasonNumber});
  Future<List<TVModel>> fetchSimilar(int id);
}
