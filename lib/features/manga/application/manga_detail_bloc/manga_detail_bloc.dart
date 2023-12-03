import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/config.dart';
import '../../../chapter/chapter.dart';
import '../../domain/domain.dart';
import '../../domain/usecase/manga_detail/fetch_manga_detail_usecase.dart';

part 'manga_detail_event.dart';
part 'manga_detail_state.dart';

@injectable
class MangaDetailBloc extends Bloc<MangaDetailEvent, MangaDetailState> {
  MangaDetailBloc(
    this._fetchMangaDetailUseCase,
  ) : super(const MangaDetailState()) {
    on<FetchMangaDetailEvent>(_fetchMangaDetail);
    on<AddChapterToListReading>(_setLastReadingToChapter);
    on<InitMangaDetailEvent>(_initLoadingManga);
  }

  final FetchMangaDetailUseCase _fetchMangaDetailUseCase;

  Future<void> _fetchMangaDetail(
    FetchMangaDetailEvent event,
    Emitter<MangaDetailState> emit,
  ) async {
    if (event.endpoint?.isEmpty ?? true) {
      log('Endpoint empty');
      return;
    }

    final either = await _fetchMangaDetailUseCase(params: event.endpoint);

    either.fold(
      (error) {
        log(error.toString());
        emit(state.copyWith(status: MangaDetailStatus.failed));
      },
      (data) => emit(state.copyWith(
        mangaDetail: data,
        status: MangaDetailStatus.success,
      )),
    );
  }

  Future<void> _initLoadingManga(
    InitMangaDetailEvent event,
    Emitter<MangaDetailState> emit,
  ) async {
    emit(state.copyWith(mangaDetail: event.mangaDetail));
  }

  Future<void> _setLastReadingToChapter(
    AddChapterToListReading event,
    Emitter<MangaDetailState> emit,
  ) async {
    final newList = state.chapterReading
      ..remove(event.idManga)
      ..add(event.idManga);
    emit(state.copyWith(chapterReading: newList));
  }

  String get lastChapter {
    if (state.chapterReading.isNotEmpty) {
      final title = state.mangaDetail?.listChapter
          .firstWhere((chap) => chap.id == state.chapterReading.last)
          .title!
          .split(' ');
      final index = title!.indexWhere(
              (e) => Constants.keywordChapter.contains(e.toLowerCase())) +
          1;
      if (index == 0) {
        return 'TIẾP TỤC ĐỌC'.toUpperCase();
      } else {
        final lastChapter = title[index].replaceAll(':', '').trim();
        return 'TIẾP TỤC ĐỌC TỪ CHƯƠNG $lastChapter'.toUpperCase();
      }
    }
    return ConstantStrings.startReading.toUpperCase();
  }

  ChapterScreenParams params(String endpoint) {
    return ChapterScreenParams(
      endpoint: endpoint,
      listChap: state.mangaDetail!.listChapter,
      name: state.mangaDetail?.title ?? '',
    );
  }
}
