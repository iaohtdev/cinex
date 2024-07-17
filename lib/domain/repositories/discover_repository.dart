import 'package:cinex/data/models/movie_model.dart';

abstract class DiscoverRepository {
  Future<List<MovieModel>> discover(
      {int? genre, String? sortBy, String? originalLanguage});
}
