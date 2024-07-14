import 'package:cinex/core/model/movie_model.dart';
import 'package:equatable/equatable.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final List<MovieModel>? topRated;
  final List<MovieModel>? upcoming;
  final List<MovieModel>? trendDay;
  final List<MovieModel>? trendWeek;

  const MoviesLoaded({
    this.topRated,
    this.upcoming,
    this.trendDay,
    this.trendWeek,
  });

  @override
  List<Object> get props => [topRated ?? [], upcoming ?? []];
}

class MoviesError extends MoviesState {
  final String message;

  const MoviesError(this.message);

  @override
  List<Object> get props => [message];
}
