import 'package:bloc/bloc.dart';
import 'package:cinex/cubits/cubits.dart';
import 'package:cinex/model/models.dart';
import 'package:cinex/repositories/repositories.dart';
import 'package:cinex/utils/enum/genres_enum.dart';

class DiscoverCubit extends Cubit<DiscoverState> {
  DiscoverCubit() : super(DiscoverInitial());

  Future<List<MovieModel>> discover({
    int? genre,
  }) async {
    try {
      emit(DiscoverLoading());
      final moviesResponse = await DiscoverRepository.discover(genre: genre);

      emit(DiscoverLoaded(moviesResponse));
      return moviesResponse;
    } catch (e) {
      emit(const DiscoverLError('Failed to fetch movies'));
    }
    return [];
  }

  Future<void> fetchMoviesByGenre() async {
    try {
      emit(DiscoverLoading());

      final actionMovies =
          await DiscoverRepository.discover(genre: GenresType.action.id);
      final adventureMovies =
          await DiscoverRepository.discover(genre: GenresType.adventure.id);
      final comedyMovies =
          await DiscoverRepository.discover(genre: GenresType.comedy.id);
      final horrorMovies =
          await DiscoverRepository.discover(genre: GenresType.horror.id);
      final dramaMovies =
          await DiscoverRepository.discover(genre: GenresType.drama.id);
      final thrillerMovies =
          await DiscoverRepository.discover(genre: GenresType.thriller.id);

      emit(DiscoverTypeMovieLoaded(
        action: actionMovies,
        adventure: adventureMovies,
        comedy: comedyMovies,
        horror: horrorMovies,
        drama: dramaMovies,
        thriller: thrillerMovies,
      ));
    } catch (e) {
      emit(const DiscoverLError('Failed to fetch movies'));
    }
  }
}
