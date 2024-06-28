import 'package:bloc/bloc.dart';
import 'package:cinex/cubits/cubits.dart';
import 'package:cinex/model/movie_model.dart';
import 'package:cinex/repositories/movie/movie_repository.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesInitial());

  Future<void> fetchMovie() async {
    try {
      emit(MoviesLoading());
      final nowPlaying = await MovieRepository.fetchNowPlayingMovies();
      final upcomming = await MovieRepository.fetchUpCommingMovies();
      final trendingRepo = await MovieRepository.trending();
      List<MovieModel> day = trendingRepo['day'] ?? [];
      List<MovieModel> week = trendingRepo['week'] ?? [];
      emit(MoviesLoaded(
          nowPlaying: nowPlaying,
          upcoming: upcomming,
          trendDay: day,
          trendWeek: week));
    } catch (e) {
      emit(const MoviesError('Failed to fetch movies'));
    }
  }
}
