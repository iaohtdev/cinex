import 'package:cinex/model/models.dart';
import 'package:cinex/provider/api_config.dart';
import 'package:cinex/service/dio_service.dart';

class CastRepository {
  static Future<List<CastModel>> fetchCast(int id) async {
    List<CastModel> casts = [];

    final reponse =
        await DioService().get('${ApiConfig.movie}/$id${ApiConfig.credits}');

    for (var i in reponse.data['cast']) {
      if (i['profile_path'] != null) casts.add(CastModel.fromJson(i));
    }
    return casts;
  }
}
