import 'package:cinex/features/cinex/presentation/cubits/cubits.dart';
import 'package:cinex/features/cinex/domain/repository/repositories.dart';
import 'package:cinex/features/cinex/domain/repository/tv_repository.dart';
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
