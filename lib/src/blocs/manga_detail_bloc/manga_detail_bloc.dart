import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../src/resources/manga_detail_repo.dart';
import 'bloc.dart';

class MangaDetailBloc extends Bloc<MangaDetailEvent, MangaDetailState> {
  MangaDetailBloc(this._detailRepo) : super(InitialMangaDetailState());
  final MangaDetailRepo _detailRepo;

  @override
  Stream<MangaDetailState> mapEventToState(MangaDetailEvent event) async* {
    if (event is FetchMangaDetailEvent) {
      yield MangaDetailLoadingState();
      try {
        final data = await _detailRepo.fetchMangaDetail(event.endpoint);
        yield MangaDetailLoadedState(data: data);
      } catch (e) {
        yield MangaDetailFailureState(msg: e.toString());
      }
    }
  }
}
