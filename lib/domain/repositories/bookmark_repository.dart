import 'package:cinex/data/models/movie_model.dart';

abstract class BookmarkRepository {
  Future<void> addToBookmark(MovieModel movie);
  Future<void> removeFromBookmark(int movieId);
  bool isBookmark(int movieId);
  List<MovieModel> getBookmarks();
}
