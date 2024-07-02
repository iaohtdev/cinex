import 'package:cinex/cubits/cubits.dart';
import 'package:cinex/repositories/repositories.dart';
import 'package:cinex/repositories/tv/tv_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailTVCubit extends Cubit<DetailTVState> {
  DetailTVCubit() : super(DetailTVInitial());

  Future<void> fetchDetail(int id) async {
    try {
      emit(DetailTVLoading());
      final tv = await TVRepository.fetchDetailTV(id);
      final similars = await TVRepository.fetchSimilar(id);
      final casts = await CastRepository.fetchCastTV(id);

      emit(DetailTVsLoaded(tv: tv, casts: casts, similars: similars));
    } catch (e) {
      emit(DetailTVError('$e'));
    }
  }
}
