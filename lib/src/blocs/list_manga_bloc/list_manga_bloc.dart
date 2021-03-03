import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irohasu/src/models/manga_list_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../src/resources/list_manga_repo.dart';
import './bloc.dart';

class ListMangaBloc extends Bloc<ListMangaEvent, ListMangaState> {
  ListMangaBloc(this._listRepo) : super(InitialListMangaState());
  final ListMangaRepo _listRepo;

  bool _hasReachedMax(ListMangaState state) =>
      state is ListMangaLoadedState && state.hasReachedEnd;

  @override
  Stream<Transition<ListMangaEvent, ListMangaState>> transformEvents(
      Stream<ListMangaEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(const Duration(milliseconds: 500)), transitionFn);
  }

  @override
  Stream<ListMangaState> mapEventToState(ListMangaEvent event) async* {
    final currentState = state;
    var page = 0;
    List<MangaListModel> data;

    if (event is FetchListMangaEvent && !_hasReachedMax(currentState)) {
      try {
        if (currentState is InitialListMangaState) {
          yield ListMangaLoadingState();
          data = await _listRepo.fetchListManga(page: page += 1);
          yield ListMangaLoadedState(
              data: data, page: page + 1, hasReachedEnd: false);
        }
        if (currentState is ListMangaLoadedState) {
          try {
            var data = await _listRepo.fetchListManga(page: currentState.page);
            yield data.isEmpty
                ? currentState.cloneWith(
                    hasReachedEnd: true, data: currentState.data)
                : ListMangaLoadedState(
                    data: currentState.data + data,
                    hasReachedEnd: false,
                    page: currentState.page += 1);
          } catch (e) {
            yield ListMangaLoadedState(
                data: currentState.data,
                hasReachedEnd: true,
                page: currentState.page);
          }
        }
      } catch (exception) {
        yield ListMangaFailureState(msg: exception.toString());
      }
    }
    if (state is InitialListMangaState) {
      yield ListMangaLoadingState();
      try {
        data = await _listRepo.fetchListManga(page: page);
        yield data.length < 20
            ? ListMangaLoadedState(data: data, page: page, hasReachedEnd: true)
            : ListMangaLoadedState(
                data: data, page: page += 1, hasReachedEnd: false);
      } catch (e) {
        yield ListMangaFailureState(msg: e.toString());
      }
    }
  }
}
