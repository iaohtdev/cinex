import 'package:bloc/bloc.dart';
import 'package:cinex/domain/repositories/repositories.dart';
import 'package:cinex/presentation/cubits/cubits.dart';
import 'package:cinex/data/models/models.dart';
import 'package:cinex/domain/enum/genres_enum.dart';
import 'package:cinex/domain/enum/sort_by_enum.dart';

class DiscoverCubit extends Cubit<DiscoverState> {
  DiscoverRepository discoverRepository;
  DiscoverCubit(this.discoverRepository) : super(DiscoverInitial());

  Future<void> fetchMovieByQuery() async {
    try {
      emit(DiscoverLoading());

      final actionMoviesFuture =
          discoverRepository.discover(genre: GenresType.action.id);
      final adventureMoviesFuture =
          discoverRepository.discover(genre: GenresType.anime.id);
      final comedyMoviesFuture =
          discoverRepository.discover(genre: GenresType.comedy.id);
      final horrorMoviesFuture =
          discoverRepository.discover(genre: GenresType.horror.id);
      final dramaMoviesFuture =
          discoverRepository.discover(genre: GenresType.drama.id);
      final thrillerMoviesFuture =
          discoverRepository.discover(genre: GenresType.thriller.id);
      final vnMovies = discoverRepository.discover(
          sortBy: SortByType.popularity_desc.name, originalLanguage: 'vi');
      final krMovies = discoverRepository.discover(originalLanguage: 'ko');

      final List<List<MovieModel>> results = await Future.wait([
        actionMoviesFuture,
        adventureMoviesFuture,
        comedyMoviesFuture,
        horrorMoviesFuture,
        dramaMoviesFuture,
        thrillerMoviesFuture,
        vnMovies,
        krMovies,
      ]);

      emit(DiscoverLoaded(
        action: results[0],
        anime: results[1],
        comedy: results[2],
        horror: results[3],
        drama: results[4],
        thriller: results[5],
        vnMovies: results[6],
        koreaMovies: results[7],
      ));
    } catch (e) {
      print(e);
      emit(const DiscoverLError('Failed to fetch movies'));
    }
  }
}
