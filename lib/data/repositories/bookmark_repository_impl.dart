import 'package:cinex/data/datasources/bookmark_remote_data_source.dart';
import 'package:cinex/data/models/movie_model.dart';
import 'package:cinex/domain/repositories/bookmark_repository.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  final BookmarkLocalDataSource localDataSource;

  BookmarkRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<void> addToBookmark(MovieModel movie) async {
    await localDataSource.addToBookmark(movie);
  }

  @override
  List<MovieModel> getBookmarks() {
    return localDataSource.getBookmarks();
  }

  @override
  bool isBookmark(int movieId) {
    return localDataSource.isBookmark(movieId);
  }

  @override
  Future<void> removeFromBookmark(int movieId) async {
    await localDataSource.removeFromBookmark(movieId);
  }
}
