import 'package:cinex/presentation/cubits/cubits.dart';
import 'package:cinex/domain/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailMovieCubit extends Cubit<DetailMovieState> {
  CastRepository castRepository;
  MovieRepository movieRepository;
  DetailMovieCubit(this.castRepository, this.movieRepository)
      : super(DetailMovieInitial());

  Future<void> fetchDetail(int id) async {
    try {
      emit(DetailMoviesLoading());
      final moviesResponse = await movieRepository.fetchDetailMovie(id);
      final lstRcm = await movieRepository.fetchSimilar(id);
      final casts = await castRepository.fetchCastMovie(id);

      emit(DetailMoviesLoaded(
          movies: moviesResponse, similar: lstRcm, casts: casts));
    } catch (e) {
      emit(DetailMoviesError('$e'));
    }
  }
}
