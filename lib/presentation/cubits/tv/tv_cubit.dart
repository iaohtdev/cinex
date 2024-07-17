import 'package:bloc/bloc.dart';
import 'package:cinex/presentation/cubits/cubits.dart';
import 'package:cinex/domain/repositories/tv_repository.dart';

class TVCubit extends Cubit<TVState> {
  TVRepository tvRepository;
  TVCubit(this.tvRepository) : super(TVInitial());

  Future<void> fetchTV() async {
    try {
      emit(TVLoading());

      final trendingTV = await tvRepository.trendingTVDay();

      emit(TVLoaded(trendTvDay: trendingTV));
    } catch (e) {
      emit(const TVError('Failed to fetch movies'));
      print(e);
    }
  }
}
