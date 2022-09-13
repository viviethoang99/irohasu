import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../../download/download.dart';
import '../../chapter.dart';

part 'chapter_screen_state.dart';

@injectable
class ChapterScreenCubit extends Cubit<ChapterScreenState> {
  ChapterScreenCubit(
    this.fetchDataChapterUsecase,
    this.findChapterUsecase,
  ) : super(const ChapterScreenState());

  final FetchDataChapterUsecase fetchDataChapterUsecase;
  final FindChapterUsecase findChapterUsecase;

  Future<void> initLoad(String endpoint) async {
    final result = await findChapterUsecase.call(params: endpoint);
    result.fold(
      (l) => fetchDataFromApi(endpoint),
      (data) => emit(state.copyWith(
        chapter: data,
        isLoading: false,
      )),
    );
  }

  void nextChap() => fetchDataFromApi(state.chapter!.nextChapter!);

  void prevChap() => fetchDataFromApi(state.chapter!.prevChapter!);

  Future<void> fetchDataFromApi(String endpoint) async {
    emit(const ChapterScreenState(
      isLoading: true,
      error: '',
    ));
    final either = await fetchDataChapterUsecase(params: endpoint);
    emit(either.fold(
      (error) => state.copyWith(error: error.toString()),
      (data) => state.copyWith(
        chapter: data,
        isLoading: false,
      ),
    ));
  }
}
