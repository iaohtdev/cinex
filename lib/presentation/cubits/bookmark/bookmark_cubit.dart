import 'package:cinex/data/models/movie_model.dart';
import 'package:cinex/domain/repositories/bookmark_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  final BookmarkRepository bookmarkRepository;

  BookmarkCubit(this.bookmarkRepository) : super(BookmarkInitial());

  Future<void> addBookmark(MovieModel movie) async {
    await bookmarkRepository.addToBookmark(movie);
    emit(BookmarkAdded(movie));
    getBookmark();
  }

  Future<void> removeFavorite(int productId) async {
    await bookmarkRepository.removeFromBookmark(productId);
    emit(BookmarkRemoved(productId));
    getBookmark();
  }

  void checkIfFavorite(int productId) {
    final isFav = bookmarkRepository.isBookmark(productId);
    emit(BookmarkChecked(productId, isFav));
  }

  Future<void> getBookmark() async {
    final favorites = bookmarkRepository.getBookmarks();
    emit(BookmarksLoaded(favorites));
  }
}
