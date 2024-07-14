import 'package:bloc/bloc.dart';
import 'package:cinex/features/cinex/presentation/cubits/trailer/trailer_state.dart';
import 'package:cinex/features/cinex/domain/repository/trailer_repository.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerInitial());

  Future<void> fetchTrailer({required int id}) async {
    try {
      emit(TrailerLoading());

      final Trailer = await TrailerRepository.fetchTrailer(id);

      emit(TrailersLoaded(trailer: Trailer));
    } catch (e) {
      emit(const TrailerError('Failed to fetch movies'));
      print(e);
    }
  }
}
