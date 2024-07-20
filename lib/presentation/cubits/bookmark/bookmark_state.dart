part of 'bookmark_cubit.dart';

abstract class BookmarkState extends Equatable {
  const BookmarkState();

  @override
  List<Object> get props => [];
}

class BookmarkInitial extends BookmarkState {}

class BookmarkAdded extends BookmarkState {
  final MovieModel movie;

  const BookmarkAdded(this.movie);

  @override
  List<Object> get props => [movie];
}

class BookmarkRemoved extends BookmarkState {
  final int movieId;

  const BookmarkRemoved(this.movieId);

  @override
  List<Object> get props => [movieId];
}

class BookmarkChecked extends BookmarkState {
  final int movieId;
  final bool isBookmark;

  const BookmarkChecked(this.movieId, this.isBookmark);

  @override
  List<Object> get props => [movieId, isBookmark];
}

class BookmarksLoaded extends BookmarkState {
  final List<MovieModel> movies;

  const BookmarksLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}
