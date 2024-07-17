import 'package:bloc/bloc.dart';
import 'package:cinex/presentation/cubits/cubits.dart';
import 'package:cinex/core/model/movie_model.dart';
import 'package:cinex/domain/repository/movie_repository.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesInitial());

  Future<void> fetchMovie() async {
    try {
      emit(MoviesLoading());
      final topRated = await MovieRepository.fetchTopRatedMovies();
      final upcomming = await MovieRepository.fetchUpCommingMovies();
      final trendingRepo = await MovieRepository.trending();

      List<MovieModel> day = trendingRepo['day'] ?? [];
      List<MovieModel> week = trendingRepo['week'] ?? [];
      emit(MoviesLoaded(
        topRated: topRated,
        upcoming: upcomming,
        trendDay: day,
        trendWeek: week,
      ));
    } catch (e) {
      emit(const MoviesError('Failed to fetch movies'));
    }
  }
}
