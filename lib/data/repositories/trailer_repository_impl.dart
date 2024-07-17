import 'package:cinex/data/datasources/trailer_remote_data_source.dart';
import 'package:cinex/data/models/trailer_model.dart';
import 'package:cinex/domain/repositories/trailer_repository.dart';

class TrailerRepositoryImpl implements TrailerRepository {
  TrailerRemoteDataSource trailerRemoteDataSource;

  TrailerRepositoryImpl({required this.trailerRemoteDataSource});
  @override
  Future<TrailerModel?> fetchTrailer(int id) async {
    return trailerRemoteDataSource.fetchTrailer(id);
  }
}
