part of 'chapter_screen_cubit.dart';

class ChapterScreenState extends Equatable {
  const ChapterScreenState({
    this.chapter,
    this.mangaDetail,
    this.isLoading = true,
    this.error = '',
    this.indexChapter = 0,
  });

  final ChapterModel? chapter;
  final MangaDetail? mangaDetail;
  final bool isLoading;
  final String error;
  final int indexChapter;

  ChapterScreenState copyWith({
    ChapterModel? chapter,
    MangaDetail? mangaDetail,
    bool? isLoading,
    String? error,
    int? indexChapter,
    ItemScrollController? scrollListController,
  }) {
    return ChapterScreenState(
      chapter: chapter ?? this.chapter,
      mangaDetail: mangaDetail ?? this.mangaDetail,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      indexChapter: indexChapter ?? this.indexChapter,
    );
  }

  @override
  List<Object?> get props => [
        chapter,
        mangaDetail,
        isLoading,
        error,
        indexChapter,
      ];
}
