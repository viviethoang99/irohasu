import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../chapter.dart';

part 'chapter_screen_state.dart';

@injectable
class ChapterScreenCubit extends Cubit<ChapterScreenState> {
  ChapterScreenCubit(
    this.fetchDataChapterUsecase,
  ) : super(const ChapterScreenState());

  final FetchDataChapterUsecase fetchDataChapterUsecase;

  Future<void> initLoad(String endpoint) async {
    await fetchDataFromApi(endpoint);
  }

  String get nameChapter =>
      state.chapter?.title!
          .replaceAll(state.chapter!.nameManga!, '')
          .trim()
          .capitalize() ??
      '';

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
