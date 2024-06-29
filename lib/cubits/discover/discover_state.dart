import 'package:cinex/model/models.dart';
import 'package:equatable/equatable.dart';

sealed class DiscoverState extends Equatable {
  const DiscoverState();

  @override
  List<Object> get props => [];
}

final class DiscoverInitial extends DiscoverState {}

class DiscoverLoading extends DiscoverState {}

class DiscoverLoaded extends DiscoverState {
  final List<MovieModel>? action;
  final List<MovieModel>? anime;
  final List<MovieModel>? comedy;
  final List<MovieModel>? horror;
  final List<MovieModel>? drama;
  final List<MovieModel>? thriller;
  final List<MovieModel>? vnMovies;
  final List<MovieModel>? koreaMovies;
  const DiscoverLoaded(
      {this.action,
      this.anime,
      this.comedy,
      this.drama,
      this.horror,
      this.vnMovies,
      this.thriller,
      this.koreaMovies});
}

class DiscoverLError extends DiscoverState {
  final String message;

  const DiscoverLError(this.message);

  @override
  List<Object> get props => [message];
}
