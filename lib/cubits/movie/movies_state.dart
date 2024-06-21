import 'package:cinex/model/movie_model.dart';
import 'package:equatable/equatable.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final List<MovieModel>? nowPlaying;
  final List<MovieModel>? upcoming;

  const MoviesLoaded({this.nowPlaying, this.upcoming});

  @override
  List<Object> get props => [nowPlaying ?? [], upcoming ?? []];
}

class MoviesError extends MoviesState {
  final String message;

  const MoviesError(this.message);

  @override
  List<Object> get props => [message];
}
