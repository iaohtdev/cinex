import 'package:cinex/model/episode_model.dart';
import 'package:equatable/equatable.dart';

sealed class EpisodeState extends Equatable {
  const EpisodeState();

  @override
  List<Object> get props => [];
}

final class EpisodeInitial extends EpisodeState {}

class EpisodeLoading extends EpisodeState {}

class EpisodesLoaded extends EpisodeState {
  final EpisodeModel? episode;

  const EpisodesLoaded({
    this.episode,
  });
}

class EpisodeError extends EpisodeState {
  final String message;

  const EpisodeError(this.message);

  @override
  List<Object> get props => [message];
}
