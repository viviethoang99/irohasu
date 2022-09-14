import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../chapter/domain/usecase/chapter_usecase/fetch_data_chapter_usecase.dart';
import '../../../github/domain/usecase/setting_usecase/get_download_path_usecase.dart';
import '../../domain/usecase/download_usecase/delete_chapter_usecase.dart';
import '../../domain/usecase/download_usecase/delete_manga_usecase.dart';
import '../../domain/usecase/download_usecase/download_chap_usecase.dart';

part 'manage_download_event.dart';
part 'manage_download_state.dart';

@lazySingleton
class ManageDownloadBloc
    extends Bloc<ManageDownloadEvent, ManageDownloadState> {
  ManageDownloadBloc(
    this._fetchDataChapterUsecase,
    this._downloadChapUsecase,
    this._getDownloadPathUseCase,
    this._deleteChapUsecase,
    this._deleteMangaUsecase,
  ) : super(const ManageDownloadState()) {
    on<AddChapterEvent>(_addChapter);
    on<DownloadChapterEvent>(_downloadChapter);
    on<AddMangaEvent>(_downloadManga);
    on<DeleteChapterEvent>(_deleteChapter);
    on<DeleteMangaEvent>(_deleteManga);
  }

  final FetchDataChapterUsecase _fetchDataChapterUsecase;
  final DownloadChapUsecase _downloadChapUsecase;
  final GetDownloadPathUseCase _getDownloadPathUseCase;
  final DeleteMangaUsecase _deleteMangaUsecase;
  final DeleteChapUsecase _deleteChapUsecase;

  Future<void> _addChapter(
    AddChapterEvent event,
    Emitter<ManageDownloadState> emit,
  ) async {
    if (state.chapterDownload.length < 2) {
      add(DownloadChapterEvent(event.endpoint));
    } else {
      emit(state.addToAwaitDownload(event.endpoint));
    }
  }

  Future<void> _downloadChapter(
    DownloadChapterEvent event,
    Emitter<ManageDownloadState> emit,
  ) async {
    emit(state.copyWith(
      chapterDownload: [...state.chapterDownload, event.endpoint],
    ));
    final manga = await _fetchDataChapterUsecase.call(params: event.endpoint);
    await manga.fold((l) => null, (chap) async {
      final path = await _getDownloadPathUseCase.call();
      await path.fold(
        (l) => null,
        (r) async {
          final params = DownloadChapParams(chapter: chap, path: r);
          await _downloadChapUsecase.call(params: params);
        },
      );
    });
    emit(state.removeChapterDownloadByEndpoint(event.endpoint));
    if (state.chapterWait.isNotEmpty) {
      final url = state.chapterWait.first;
      emit(state.removeChapterWaitByEndpoint(url));
      add(DownloadChapterEvent(url));
    }
  }

  Future<void> _downloadManga(
    AddMangaEvent event,
    Emitter<ManageDownloadState> emit,
  ) async {
    emit(state.copyWith(
      chapterWait: [...state.chapterWait, ...event.listEndpoint],
    ));
    if (state.chapterDownload.length < 2) {
      add(DownloadChapterEvent(state.chapterWait.first));
    }
  }

  Future<void> _deleteChapter(
    DeleteChapterEvent event,
    Emitter<ManageDownloadState> emit,
  ) async {
    _deleteChapUsecase.call(params: event.idChapter);
  }

  Future<void> _deleteManga(
    DeleteMangaEvent event,
    Emitter<ManageDownloadState> emit,
  ) async {
    _deleteMangaUsecase.call(params: event.idManga);
  }
}
