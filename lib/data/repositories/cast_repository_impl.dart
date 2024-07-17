import 'package:cinex/data/datasources/cast_remote_data_source.dart';
import 'package:cinex/data/models/models.dart';
import 'package:cinex/domain/repositories/cast_repository.dart';

class CastRepositoryImpl implements CastRepository {
  final CastRemoteDataSource remoteDataSource;
  CastRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<CastModel>> fetchCastMovie(int id) async {
    final casts = await remoteDataSource.fetchCastMovie(id);
    return casts.map((model) => model).toList();
  }

  @override
  Future<List<CastModel>> fetchCastTV(int id) async {
    final casts = await remoteDataSource.fetchCastTV(id);
    return casts.map((model) => model).toList();
  }
}
