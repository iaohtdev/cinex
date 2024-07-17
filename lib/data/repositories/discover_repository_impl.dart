import 'package:cinex/data/datasources/discover_remote_data_source.dart';
import 'package:cinex/data/models/models.dart';
import 'package:cinex/domain/repositories/discover_repository.dart';

class DiscoverRepositoryImpl implements DiscoverRepository {
  DiscoverRemoteDataSource discoverRemoteDataSource;
  DiscoverRepositoryImpl({required this.discoverRemoteDataSource});
  @override
  Future<List<MovieModel>> discover(
      {int? genre, String? sortBy, String? originalLanguage}) async {
    final reponse = await discoverRemoteDataSource.discover(
        genre: genre, sortBy: sortBy, originalLanguage: originalLanguage);
    return reponse;
  }
}
