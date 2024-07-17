import 'package:cinex/core/model/cast_model.dart';
import 'package:cinex/core/model/movie_model.dart';
import 'package:equatable/equatable.dart';

sealed class DetailMovieState extends Equatable {
  const DetailMovieState();

  @override
  List<Object> get props => [];
}

final class DetailMovieInitial extends DetailMovieState {}

class DetailMoviesInitial extends DetailMovieState {}

class DetailMoviesLoading extends DetailMovieState {}

class DetailMoviesLoaded extends DetailMovieState {
  final MovieModel? movies;
  final List<MovieModel>? similar;
  final List<CastModel>? casts;

  const DetailMoviesLoaded({this.movies, this.similar, this.casts});

  @override
  List<Object> get props => [movies!];
}

class DetailMoviesError extends DetailMovieState {
  final String message;

  const DetailMoviesError(this.message);

  @override
  List<Object> get props => [message];
}
