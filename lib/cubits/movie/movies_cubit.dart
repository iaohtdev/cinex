import 'package:bloc/bloc.dart';
import 'package:cinex/cubits/cubits.dart';
import 'package:cinex/repositories/movie/movie_repository.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesInitial());

  Future<void> fetchMovie() async {
    try {
      emit(MoviesLoading());
      final nowPlaying = await MovieRepository.fetchNowPlayingMovies();
      final upcomming = await MovieRepository.fetchUpCommingMovies();
      emit(MoviesLoaded(nowPlaying: nowPlaying, upcoming: upcomming));
    } catch (e) {
      emit(const MoviesError('Failed to fetch movies'));
    }
  }
}
