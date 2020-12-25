import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../src/models/manga_detail_model.dart';
import '../../../src/resources/manga_detail_repo.dart';
import 'bloc.dart';

class MangaDetailBloc extends Bloc<MangaDetailEvent, MangaDetailState> {
  final MangaDetailRepo _detailRepo;

  MangaDetailBloc(this._detailRepo) : super(InitialMangaDetailState());

  @override
  Stream<MangaDetailState> mapEventToState(MangaDetailEvent event) async* {
    if (event is FetchMangaDetailEvent) {
      yield MangaDetailLoadingState();
      try {
        final MangaDetail data =
            await _detailRepo.getMangaDetail(event.endpoint);
        yield MangaDetailLoadedState(data: data);
      } catch (e) {
        yield MangaDetailFailureState(msg: e.toString());
      }
    }
  }
}
