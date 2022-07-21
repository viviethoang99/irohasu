import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_content.dart';
import '../../../../config/config.dart';
import '../../../chapter/chapter.dart';
import '../../domain/domain.dart';
import '../../domain/usecase/manga_detail/fetch_manga_detail_usecase.dart';

part 'manga_detail_event.dart';
part 'manga_detail_state.dart';

@injectable
class MangaDetailBloc extends Bloc<MangaDetailEvent, MangaDetailState> {
  MangaDetailBloc(
    @factoryParam this.endpoint,
    this._fetchMangaDetailUseCase,
  ) : super(MangaDetailLoadingState()) {
    on<FetchMangaDetailEvent>(_fetchMangaDetail);
    on<AddChapterToListReading>(_setLastReadingToChapter);
  }

  final FetchMangaDetailUseCase _fetchMangaDetailUseCase;
  final String endpoint;

  MangaDetailSuccessState? get currentState {
    if (state is MangaDetailSuccessState) {
      return state as MangaDetailSuccessState;
    }
    return null;
  }

  Future<void> _fetchMangaDetail(
    FetchMangaDetailEvent event,
    Emitter<MangaDetailState> emit,
  ) async {
    emit(MangaDetailLoadingState());
    final either = await _fetchMangaDetailUseCase(params: endpoint);
    emit(either.fold(
      (error) => MangaDetailFailureState(msg: error.runtimeType.toString()),
      (data) => MangaDetailSuccessState(mangaDetail: data),
    ));
  }

  Either<void, MangaDetail> get idManga {
    if (state is MangaDetailSuccessState) {
      final data = (state as MangaDetailSuccessState).mangaDetail;
      return Right(data);
    } else {
      return const Left(null);
    }
  }

  Future<void> _setLastReadingToChapter(
    AddChapterToListReading event,
    Emitter<MangaDetailState> emit,
  ) async {
    final newList = currentState!.chapterReading
      ..remove(event.idManga)
      ..add(event.idManga);
    emit(currentState!.copyWith(chapterReading: newList));
  }

  String get lastChapter {
    if (currentState!.chapterReading.isNotEmpty) {
      final title = currentState!.mangaDetail.listChapter
          .firstWhere((chap) => chap.id == currentState!.chapterReading.last)
          .title!
          .split(' ');
      final index = title.indexWhere(
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
      listChap: currentState!.mangaDetail.listChapter,
      name: currentState!.mangaDetail.title,
    );
  }
}
