import 'package:bloc/bloc.dart';
import 'package:cinex/presentation/cubits/episode/episode_state.dart';
import 'package:cinex/domain/repositories/tv_repository.dart';

class EpisodeCubit extends Cubit<EpisodeState> {
  TVRepository tvRepository;
  EpisodeCubit(this.tvRepository) : super(EpisodeInitial());

  Future<void> fetchEpisode(
      {required int id, required int seasonNumber}) async {
    try {
      emit(EpisodeLoading());

      final episode =
          await tvRepository.fetchEpisode(id: id, seasonNumber: seasonNumber);

      emit(EpisodesLoaded(episode: episode));
    } catch (e) {
      emit(const EpisodeError('Failed to fetch movies'));
      print(e);
    }
  }
}
