import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../download.dart';

@injectable
class DownloadMangaCubit extends Cubit<List<String>> {
  DownloadMangaCubit(
    @factoryParam this.idManga,
    this._repositoryImpl,
  ) : super([]);

  final String idManga;
  StreamSubscription? _streamSubscription;
  final IDownloadRepository _repositoryImpl;

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    await super.close();
  }

  Future<void> loadChapter() async {
    emit([]);
    final either = await _repositoryImpl.findAllChapterDownload(idManga);
    emit(either);
  }

  Future<void> watchManga() async {
    await loadChapter();
    final either = _repositoryImpl.watchListChapterDownload(idManga);
    either.listen(emit);
  }
}
