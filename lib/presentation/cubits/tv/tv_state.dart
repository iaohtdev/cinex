import 'package:cinex/data/models/tv_model.dart';
import 'package:equatable/equatable.dart';

abstract class TVState extends Equatable {
  const TVState();

  @override
  List<Object> get props => [];
}

class TVInitial extends TVState {}

class TVLoading extends TVState {}

class TVLoaded extends TVState {
  final List<TVModel>? trendTvDay;

  const TVLoaded({
    this.trendTvDay,
  });

  @override
  List<Object> get props => [trendTvDay ?? []];
}

class TVError extends TVState {
  final String message;

  const TVError(this.message);

  @override
  List<Object> get props => [message];
}
