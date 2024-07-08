import 'package:cinex/model/models.dart';
import 'package:equatable/equatable.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<MovieModel> movies;
  final List<MovieModel> tv;
  final List<CastModel> casts;
  const SearchLoaded(this.movies, this.tv, this.casts);

  @override
  List<Object> get props => [movies, tv, casts];
}

class SearchError extends SearchState {
  final String message;

  const SearchError(this.message);

  @override
  List<Object> get props => [message];
}
