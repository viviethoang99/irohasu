import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../resources/list_manga_repo.dart';
import './bloc.dart';

class ListMangaBloc extends Bloc<ListMangaEvent, ListMangaState> {
  ListMangaBloc(this._listRepo) : super(InitialListMangaState());
  final ListMangaRepo _listRepo;

  bool _hasReachedMax(ListMangaState state) =>
      state is ListMangaLoadedState && state.hasReachedEnd!;

  @override
  Stream<Transition<ListMangaEvent, ListMangaState>> transformEvents(
      Stream<ListMangaEvent> events, transitionFn) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<ListMangaState> mapEventToState(ListMangaEvent event) async* {
    final currentState = state;
    var page = 1;

    if (event is FetchListMangaEvent && !_hasReachedMax(currentState)) {
      yield* _fetchMangaToState(currentState, page);
    }
    if (event is InitialFetchMangaEvent) {
      yield* _initialEventToState(currentState, page);
    }
    if (event is RefreshMangaEvent) {
      yield* _refreshEventToState(currentState, page);
    }
  }

  Stream<ListMangaState> _fetchMangaToState(
    ListMangaState currentState,
    int page,
  ) async* {
    if (currentState is InitialListMangaState) {
      yield ListMangaLoadingState();
      final data = await _listRepo.fetchListManga(page: page);
      yield ListMangaLoadedState(
        data: data,
        page: page += 1,
        hasReachedEnd: false,
      );
    }
    if (currentState is ListMangaLoadedState) {
      var data = await _listRepo.fetchListManga(page: currentState.page);
      yield data.isEmpty
          ? currentState.cloneWith(hasReachedEnd: true)
          : ListMangaLoadedState(
              data: currentState.data! + data,
              hasReachedEnd: false,
              page: currentState.page += 1,
            );
    }
  }

  Stream<ListMangaState> _initialEventToState(
    ListMangaState currentState,
    int page,
  ) async* {
    try {
      if (currentState is InitialListMangaState) {
        yield ListMangaLoadingState();
        final data = await _listRepo.fetchListManga(page: page);
        yield ListMangaLoadedState(
          data: data,
          hasReachedEnd: data.length < 20 ? true : false,
          page: data.length < 20 ? page : page + 1,
        );
      }
    } catch (e) {
      yield ListMangaFailureState(msg: e.toString());
    }
  }

  Stream<ListMangaState> _refreshEventToState(
    ListMangaState currentState,
    int page,
  ) async* {
    yield ListMangaLoadingState();
    try {
      final data = await _listRepo.fetchListManga(page: page);
      yield ListMangaLoadedState(
        data: data,
        hasReachedEnd: data.length < 20 ? true : false,
        page: data.length < 20 ? page : page + 1,
      );
    } catch (e) {
      yield ListMangaFailureState(msg: e.toString());
    }
  }
}
