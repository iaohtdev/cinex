import 'package:bloc/bloc.dart';
import 'package:cinex/features/cinex/presentation/cubits/cubits.dart';
import 'package:cinex/core/model/models.dart';
import 'package:cinex/features/cinex/domain/repository/repositories.dart';
import 'package:cinex/utils/enum/genres_enum.dart';
import 'package:cinex/utils/enum/sort_by_enum.dart';

class DiscoverCubit extends Cubit<DiscoverState> {
  DiscoverCubit() : super(DiscoverInitial());

  Future<void> fetchMovieByQuery() async {
    try {
      emit(DiscoverLoading());

      final actionMoviesFuture =
          DiscoverRepository.discover(genre: GenresType.action.id);
      final adventureMoviesFuture =
          DiscoverRepository.discover(genre: GenresType.anime.id);
      final comedyMoviesFuture =
          DiscoverRepository.discover(genre: GenresType.comedy.id);
      final horrorMoviesFuture =
          DiscoverRepository.discover(genre: GenresType.horror.id);
      final dramaMoviesFuture =
          DiscoverRepository.discover(genre: GenresType.drama.id);
      final thrillerMoviesFuture =
          DiscoverRepository.discover(genre: GenresType.thriller.id);
      final vnMovies = DiscoverRepository.discover(
          sortBy: SortByType.popularity_desc.name, originalLanguage: 'vi');
      final krMovies = DiscoverRepository.discover(originalLanguage: 'ko');

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
