import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../config/base_content.dart';
import '../../../config/config.dart';
import '../../../data/model/manga_detail_model.dart';
import '../../../domain/repositories/manga_repository.dart';

part 'manga_detail_event.dart';
part 'manga_detail_state.dart';

@injectable
class MangaDetailBloc extends Bloc<MangaDetailEvent, MangaDetailState> {
  MangaDetailBloc(this._repo, @factoryParam this.endpoint)
      : super(MangaDetailLoadingState()) {
    on<FetchMangaDetailEvent>(_fetchMangaDetail);
    on<CacheMangaDetailEvent>(_saveMangaToLocal);
    on<AddChapterToListReading>(_setLastReadingToChapter);
  }

  final IMangaRepository _repo;
  final String endpoint;

  MangaDetailSuccessState? get currentState {
    if (state is MangaDetailSuccessState) {
      return state as MangaDetailSuccessState;
    }
  }

  Future<void> _fetchMangaDetail(
    FetchMangaDetailEvent event,
    Emitter<MangaDetailState> emit,
  ) async {
    emit(MangaDetailLoadingState());
    try {
      final data = await _repo.fetchMangaDetail(endpoint);
      emit(MangaDetailSuccessState(mangaDetail: data!));
    } catch (e) {
      emit(MangaDetailFailureState(msg: e.toString()));
    }
  }

  Future<void> _saveMangaToLocal(
    CacheMangaDetailEvent event,
    Emitter<MangaDetailState> emit,
  ) async {
    if (currentState!.chapterReading.isNotEmpty) {
      await _repo.addListChapterRead(
        currentState!.chapterReading,
        currentState!.mangaDetail.idManga,
      );
      await _repo.addMangaDetail(
        currentState!.mangaDetail.copyWith(lastRead: DateTime.now()),
      );
    } else {
      await _repo.removeMangaDetail(currentState!.mangaDetail.idManga);
    }
  }

  Either<void, MangaDetailModel> get idManga {
    if (state is MangaDetailSuccessState) {
      final data = (state as MangaDetailSuccessState).mangaDetail;
      return Right(data);
    } else {
      return const Left(null);
    }
  }

  void changeStatusFavorite(
    MangaDetailModel r,
    Emitter<MangaDetailState> emit,
  ) {}

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
      final title = currentState!.mangaDetail.listChapter!
          .firstWhere((chap) => chap.id == currentState!.chapterReading.last)
          .title!
          .split(' ');
      final _index = title.indexWhere(
              (e) => Constants.keywordChapter.contains(e.toLowerCase())) +
          1;
      if (_index == 0) {
        return 'TIẾP TỤC ĐỌC'.toUpperCase();
      } else {
        final lastChapter = title[_index].replaceAll(':', '').trim();
        return 'TIẾP TỤC ĐỌC TỪ CHƯƠNG $lastChapter'.toUpperCase();
      }
    }
    return ConstantStrings.startReading.toUpperCase();
  }
}
