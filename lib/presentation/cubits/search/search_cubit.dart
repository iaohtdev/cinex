import 'package:bloc/bloc.dart';
import 'package:cinex/presentation/cubits/cubits.dart';
import 'package:cinex/data/models/models.dart';
import 'package:cinex/domain/repositories/repositories.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchRepository searchRepository;
  SearchCubit(this.searchRepository) : super(SearchInitial());

  Future<void> search({
    String? query,
  }) async {
    try {
      emit(SearchLoading());
      final searchResponse = await searchRepository.search(query: query);
      List<MovieModel> movies = searchResponse['movies'];
      List<CastModel> casts = searchResponse['casts'];
      List<MovieModel> tv = searchResponse['tv'];

      emit(SearchLoaded(movies, tv, casts));
    } catch (e) {
      emit(const SearchError('Failed to fetch movies'));
    }
  }
}
