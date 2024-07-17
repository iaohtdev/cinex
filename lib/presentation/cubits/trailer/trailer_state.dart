import 'package:cinex/data/models/trailer_model.dart';
import 'package:equatable/equatable.dart';

sealed class TrailerState extends Equatable {
  const TrailerState();

  @override
  List<Object> get props => [];
}

final class TrailerInitial extends TrailerState {}

class TrailerLoading extends TrailerState {}

class TrailersLoaded extends TrailerState {
  final TrailerModel? trailer;

  const TrailersLoaded({
    this.trailer,
  });
}

class TrailerError extends TrailerState {
  final String message;

  const TrailerError(this.message);

  @override
  List<Object> get props => [message];
}
