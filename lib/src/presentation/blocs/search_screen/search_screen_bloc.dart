import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/manga_list_model.dart';
import '../../../domain/usecaes/list_manga/find_manga_by_query_usecase.dart';

part 'search_screen_event.dart';
part 'search_screen_state.dart';

@injectable
class SearchScreenBloc extends Bloc<SearchScreenEvent, SearchScreenState> {
  SearchScreenBloc(this._findMangaByQueryUseCase)
      : super(SearchScreenInitial()) {
    on<FetchDataSearchEvent>(_searchByName);
    on<AdvancedSearchEvent>(_searchAdvanced);
  }

  final FindMangaByQueryUseCase _findMangaByQueryUseCase;

  Future<void> _searchByName(
    FetchDataSearchEvent event,
    Emitter<SearchScreenState> emit,
  ) async {
    emit(SearchScreenLoadingState());
    final list = await _findMangaByQueryUseCase(
      params: '/1/0/-1/-1?txt=${event.query.replaceAll(' ', '%20')}',
    );
    list.fold(
      (l) => emit(SearchScreenFailureState(msg: l.toString())),
      (list) => emit(SearchScreenLoadedState(list: list)),
    );
  }

  Future<void> _searchAdvanced(
    AdvancedSearchEvent event,
    Emitter<SearchScreenState> emit,
  ) async {
    emit(SearchScreenLoadingState());
    var query = '/1/0/${event.addGenres!.isNotEmpty ? event.addGenres : -1}/'
        '${event.removeGenres!.isNotEmpty ? event.removeGenres : -1}';
    if (event.author!.isNotEmpty || event.query!.isNotEmpty) {
      query += '?txt=${event.query!.replaceAll(' ', '%20')}'
          '&aut=${event.author!.replaceAll(' ', '%20')}';
    }
    final list = await _findMangaByQueryUseCase(params: query);
    list.fold(
      (l) => emit(SearchScreenFailureState(msg: l.toString())),
      (list) => emit(SearchScreenLoadedState(list: list)),
    );
  }
}
