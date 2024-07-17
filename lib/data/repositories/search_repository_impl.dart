import 'package:cinex/data/datasources/search_remote_data_source.dart';
import 'package:cinex/domain/repositories/repositories.dart';

class SearchRepositoryImpl implements SearchRepository {
  SearchRemoteDataSource searchRemoteDataSource;

  SearchRepositoryImpl({required this.searchRemoteDataSource});
  @override
  Future<Map<String, dynamic>> search({String? query}) async {
    return await searchRemoteDataSource.search(query: query);
  }
}
