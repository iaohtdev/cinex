import 'package:bloc/bloc.dart';
import 'package:cinex/presentation/cubits/cubits.dart';
import 'package:cinex/domain/repository/tv_repository.dart';

class TVCubit extends Cubit<TVState> {
  TVCubit() : super(TVInitial());

  Future<void> fetchTV() async {
    try {
      emit(TVLoading());

      final trendingTV = await TVRepository.trendingTVDay();

      emit(TVLoaded(trendTvDay: trendingTV));
    } catch (e) {
      emit(const TVError('Failed to fetch movies'));
      print(e);
    }
  }
}
