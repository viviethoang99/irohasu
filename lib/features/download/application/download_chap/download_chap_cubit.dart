import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../chapter/chapter.dart';
import '../../download.dart';

part 'download_chap_state.dart';

@injectable
class DownloadChapCubit extends Cubit<DownloadChapState> {
  DownloadChapCubit(
    this._findChapterUsecase,
    this._watchDownloadChapterUsecase,
    @factoryParam this.idChapter,
  ) : super(DownloadChapInitial());

  final String idChapter;
  StreamSubscription? _streamSubscription;
  final FindChapterUsecase _findChapterUsecase;
  final WatchDownloadChapterUsecase _watchDownloadChapterUsecase;

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    await super.close();
  }

  Future<void> loadChapter() async {
    emit(DownloadChapInitial());
    final either = await _findChapterUsecase.call(params: idChapter);
    emit(either.fold((l) => DownloadChapInitial(), DownloadingState.new));
  }

  Future<void> watchChapter() async {
    await loadChapter();
    final either = await _watchDownloadChapterUsecase.call();
    either.fold(
      (l) => emit(DownloadChapInitial()),
      (r) => r.map(changeStatus).listen(emit),
    );
  }

  DownloadChapState changeStatus(Chapter? event) {
    return event != null ? DownloadingState(event) : DownloadChapInitial();
  }
}
