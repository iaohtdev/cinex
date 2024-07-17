import 'package:cinex/core/config/api_config.dart';
import 'package:cinex/data/models/trailer_model.dart';
import 'package:cinex/di.dart';

abstract class TrailerRemoteDataSource {
  Future<TrailerModel?> fetchTrailer(int id);
}

class TrailerRemoteDataSourceImpl implements TrailerRemoteDataSource {
  @override
  Future<TrailerModel?> fetchTrailer(int id) async {
    List<TrailerModel> trailers = [];

    try {
      final response =
          await dio.get('${ApiConfig.movie}/$id${ApiConfig.video}');
      var results = response.data['results'];

      for (var i in results) {
        trailers.add(TrailerModel.fromJson(i));
      }
      if (trailers.isEmpty) {
        throw Exception('No trailers available');
      }
      if (trailers.length == 1) {
        return trailers.first;
      }
      if (trailers.length > 1) {
        List<TrailerModel> filteredTrailers = trailers
            .where((trailer) => trailer.name!.toLowerCase().contains('trailer'))
            .toList();

        return filteredTrailers.last;
      }
      if (trailers.isEmpty) {
        throw Exception('No trailers available');
      }
    } catch (e) {
      print('Error fetching trailers: $e');
      throw Exception('Failed to fetch trailers');
    }
    return null;
  }
}
