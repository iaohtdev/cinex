import 'package:bloc/bloc.dart';
import 'package:cinex/presentation/cubits/cubits.dart';
import 'package:cinex/data/models/movie_model.dart';
import 'package:cinex/domain/repositories/movie_repository.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MovieRepository movieRepository;
  MoviesCubit(this.movieRepository) : super(MoviesInitial());

  Future<void> fetchMovie() async {
    try {
      emit(MoviesLoading());
      final topRated = await movieRepository.fetchTopRatedMovies();
      final trendingRepo = await movieRepository.trending();

      List<MovieModel> day = trendingRepo['day'] ?? [];
      List<MovieModel> week = trendingRepo['week'] ?? [];
      emit(MoviesLoaded(
        topRated: topRated,
        trendDay: day,
        trendWeek: week,
      ));
    } catch (e) {
      emit(const MoviesError('Failed to fetch movies'));
    }
  }
}
