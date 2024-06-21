import 'package:cinex/cubits/cubits.dart';
import 'package:cinex/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailMovieCubit extends Cubit<DetailMovieState> {
  DetailMovieCubit() : super(DetailMovieInitial());

  Future<void> fetchDetail(int id) async {
    try {
      emit(DetailMoviesLoading());
      final moviesResponse = await MovieRepository.fetchDetailMovie(id);
      final lstRcm = await MovieRepository.fetchRecommendMovie(id);
      final casts = await CastRepository.fetchCast(id);

      emit(DetailMoviesLoaded(
          movies: moviesResponse, lstRcm: lstRcm, casts: casts));
    } catch (e) {
      emit(DetailMoviesError('$e'));
    }
  }
}
