import 'package:bloc/bloc.dart';
import 'package:cinex/features/cinex/presentation/cubits/cubits.dart';
import 'package:cinex/core/model/models.dart';
import 'package:cinex/features/cinex/domain/repository/repositories.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  Future<void> search({
    String? query,
  }) async {
    try {
      emit(SearchLoading());
      final searchResponse = await SearchRepository.search(query: query);
      List<MovieModel> movies = searchResponse['movies'];
      List<CastModel> casts = searchResponse['casts'];
      List<MovieModel> tv = searchResponse['tv'];

      emit(SearchLoaded(movies, tv, casts));
    } catch (e) {
      emit(const SearchError('Failed to fetch movies'));
    }
  }
}
