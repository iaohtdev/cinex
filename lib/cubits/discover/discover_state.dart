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
  final List<MovieModel> movies;

  const DiscoverLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class DiscoverTypeMovieLoaded extends DiscoverState {
  final List<MovieModel> action;
  final List<MovieModel> adventure;
  final List<MovieModel> comedy;
  final List<MovieModel> horror;
  final List<MovieModel> drama;
  final List<MovieModel> thriller;

  const DiscoverTypeMovieLoaded(
      {required this.action,
      required this.adventure,
      required this.comedy,
      required this.drama,
      required this.horror,
      required this.thriller});

  @override
  List<Object> get props =>
      [action, adventure, drama, horror, thriller, comedy];
}

class DiscoverLError extends DiscoverState {
  final String message;

  const DiscoverLError(this.message);

  @override
  List<Object> get props => [message];
}
