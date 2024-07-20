import 'package:cinex/data/models/cast_model.dart';
import 'package:cinex/data/models/tv_model.dart';
import 'package:equatable/equatable.dart';

class DetailTVState extends Equatable {
  const DetailTVState();

  @override
  List<Object> get props => [];
}

final class DetailTVInitial extends DetailTVState {}

class DetailTVsInitial extends DetailTVState {}

class DetailTVLoading extends DetailTVState {}

class DetailTVsLoaded extends DetailTVState {
  final TVModel? tv;
  final List<TVModel>? similars;
  final List<CastModel>? casts;

  const DetailTVsLoaded({this.tv, this.similars, this.casts});

  @override
  List<Object> get props => [tv!];
}

class DetailTVError extends DetailTVState {
  final String message;

  const DetailTVError(this.message);

  @override
  List<Object> get props => [message];
}
