import 'package:cinex/data/datasources/tv_remote_data_source.dart';
import 'package:cinex/data/models/episode_model.dart';
import 'package:cinex/data/models/tv_model.dart';
import 'package:cinex/domain/repositories/tv_repository.dart';

class TVRepositoryImpl implements TVRepository {
  TVRemoteDataSource tvRemoteDataSource;

  TVRepositoryImpl({required this.tvRemoteDataSource});
  @override
  Future<List<TVModel>> trendingTVDay() async {
    return await tvRemoteDataSource.trendingTVDay();
  }

  @override
  Future<TVModel?> fetchDetailTV(int id) async {
    return await tvRemoteDataSource.fetchDetailTV(id);
  }

  @override
  Future<EpisodeModel?> fetchEpisode(
      {required int id, required int seasonNumber}) async {
    return await tvRemoteDataSource.fetchEpisode(
        id: id, seasonNumber: seasonNumber);
  }

  @override
  Future<List<TVModel>> fetchSimilar(int id) async {
    return await tvRemoteDataSource.fetchSimilar(id);
  }
}
