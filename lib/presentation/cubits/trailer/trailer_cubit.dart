import 'package:bloc/bloc.dart';
import 'package:cinex/presentation/cubits/trailer/trailer_state.dart';
import 'package:cinex/domain/repositories/trailer_repository.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerRepository trailerRepository;
  TrailerCubit(this.trailerRepository) : super(TrailerInitial());

  Future<void> fetchTrailer({required int id}) async {
    try {
      emit(TrailerLoading());

      final Trailer = await trailerRepository.fetchTrailer(id);

      emit(TrailersLoaded(trailer: Trailer));
    } catch (e) {
      emit(const TrailerError('Failed to fetch movies'));
      print(e);
    }
  }
}
