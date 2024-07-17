import 'package:cinex/data/datasources/movie_remote_data_source.dart';
import 'package:cinex/data/models/movie_model.dart';
import 'package:cinex/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRemoteDataSource movieRemoteDataSource;
  MovieRepositoryImpl({required this.movieRemoteDataSource});

  @override
  Future<List<MovieModel>> fetchTopRatedMovies() async {
    final reponse = await movieRemoteDataSource.fetchTopRatedMovies();
    return reponse;
  }

  @override
  Future<MovieModel?> fetchDetailMovie(int id) async {
    final reponse = await movieRemoteDataSource.fetchDetailMovie(id);

    return reponse;
  }

  @override
  Future<List<MovieModel>> fetchSimilar(int id) async {
    final response = await movieRemoteDataSource.fetchSimilar(id);
    return response;
  }

  @override
  Future<Map<String, List<MovieModel>>> trending() async {
    final responses = await movieRemoteDataSource.trending();
    return responses;
  }

  @override
  Future<List<MovieModel>> trendingTVDay() async {
    return await movieRemoteDataSource.trendingTVDay();
  }
}
