import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../src/resources/search_repo.dart';
import './bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this._searchRepo) : super(InitialSearchState());

  final SearchRepo _searchRepo;

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is FetchDataSearchEvent && !(state is SearchLoadedState)) {
      try {
        if (state is InitialSearchState) {
          final list = await _searchRepo.getDataResult(query: event.query);
          yield SearchLoadedState(list: list);
        } else {
          if (state is SearchLoadedState) {
            final list = await _searchRepo.getDataResult(query: event.query);
            yield SearchLoadedState(list: list);
          }
        }
      } catch(exception) {
    yield SearchFailureState();
    }
  }
}

}