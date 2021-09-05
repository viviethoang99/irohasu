import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resources/search_repo.dart';
import './bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this._searchRepo) : super(InitialSearchState());

  final SearchRepo _searchRepo;

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is FetchDataSearchEvent) {
      yield SearchLoadingState();
      try {
        final list = await _searchRepo.getDataResult(
          query: '/1/0/-1/-1?txt=${event.query.replaceAll(' ', '%20')}',
        );
        yield SearchLoadedState(list: list ?? const []);
      } catch (exception) {
        yield SearchFailureState();
      }
    }
    if (event is AdvancedSearchEvent) {
      yield SearchLoadingState();
      try {
        var query =
            '/1/0/${event.addGenres!.isNotEmpty ? event.addGenres : -1}/'
            '${event.removeGenres!.isNotEmpty ? event.removeGenres : -1}';
        if (event.author!.isNotEmpty || event.query!.isNotEmpty) {
          query += '?txt=${event.query!.replaceAll(' ', '%20')}'
              '&aut=${event.author!.replaceAll(' ', '%20')}';
        }
        final list = await _searchRepo.getDataResult(query: query);
        yield SearchLoadedState(list: list ?? const []);
      } catch (e) {
        print(e);
        yield SearchFailureState();
      }
    }
  }
}
