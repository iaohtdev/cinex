import 'package:cinex/core/config/api_config.dart';
import 'package:cinex/data/models/models.dart';
import 'package:cinex/di.dart';

abstract class CastRemoteDataSource {
  Future<List<CastModel>> fetchCastMovie(int id);
  Future<List<CastModel>> fetchCastTV(int id);
}

class CastRemoteDataSourceImpl implements CastRemoteDataSource {
  @override
  Future<List<CastModel>> fetchCastMovie(int id) async {
    List<CastModel> casts = [];
    final response =
        await dio.get('${ApiConfig.movie}/$id${ApiConfig.credits}');
    for (var i in response.data['cast']) {
      if (i['profile_path'] != null) {
        casts.add(CastModel.fromJson(i));
      }
    }
    return casts;
  }

  @override
  Future<List<CastModel>> fetchCastTV(int id) async {
    List<CastModel> casts = [];
    final response = await dio.get('${ApiConfig.tv}/$id${ApiConfig.credits}');
    for (var i in response.data['cast']) {
      if (i['profile_path'] != null) {
        casts.add(CastModel.fromJson(i));
      }
    }
    return casts;
  }
}
