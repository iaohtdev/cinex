import 'package:cinex/features/cinex/presentation/cubits/cubits.dart';
import 'package:cinex/features/cinex/domain/repository/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailMovieCubit extends Cubit<DetailMovieState> {
  DetailMovieCubit() : super(DetailMovieInitial());

  Future<void> fetchDetail(int id) async {
    try {
      emit(DetailMoviesLoading());
      final moviesResponse = await MovieRepository.fetchDetailMovie(id);
      final lstRcm = await MovieRepository.fetchSimilar(id);
      final casts = await CastRepository.fetchCastMovie(id);

      emit(DetailMoviesLoaded(
          movies: moviesResponse, similar: lstRcm, casts: casts));
    } catch (e) {
      emit(DetailMoviesError('$e'));
    }
  }
}
