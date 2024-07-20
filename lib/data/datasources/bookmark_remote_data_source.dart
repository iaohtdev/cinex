import 'package:cinex/data/models/movie_model.dart';
import 'package:hive/hive.dart';

abstract class BookmarkLocalDataSource {
  Future<void> addToBookmark(MovieModel product);
  Future<void> removeFromBookmark(int productId);
  bool isBookmark(int movieId);
  List<MovieModel> getBookmarks();
}

class BookmarkLocalDataSourceImpl implements BookmarkLocalDataSource {
  final Box<MovieModel> bookmarksBox;

  BookmarkLocalDataSourceImpl(this.bookmarksBox);

  @override
  Future<void> addToBookmark(MovieModel movie) async {
    await bookmarksBox.put(movie.id, movie);
  }

  @override
  Future<void> removeFromBookmark(int productId) async {
    await bookmarksBox.delete(productId);
  }

  @override
  bool isBookmark(int productId) {
    return bookmarksBox.containsKey(productId);
  }

  @override
  List<MovieModel> getBookmarks() {
    return bookmarksBox.values.toList();
  }
}
