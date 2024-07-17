import 'package:cinex/domain/repositories/repositories.dart';
import 'package:cinex/presentation/cubits/cubits.dart';
import 'package:cinex/domain/repositories/tv_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailTVCubit extends Cubit<DetailTVState> {
  TVRepository tvRepository;
  CastRepository castRepository;

  DetailTVCubit(this.castRepository, this.tvRepository)
      : super(DetailTVInitial());
  Future<void> fetchDetail(int id) async {
    try {
      emit(DetailTVLoading());
      final tv = await tvRepository.fetchDetailTV(id);
      final similars = await tvRepository.fetchSimilar(id);
      final casts = await castRepository.fetchCastTV(id);

      emit(DetailTVsLoaded(tv: tv, casts: casts, similars: similars));
    } catch (e) {
      emit(DetailTVError('$e'));
    }
  }
}
