part of 'chapter_screen_cubit.dart';

class ChapterScreenState extends Equatable {
  const ChapterScreenState({
    this.chapter,
    this.mangaDetail,
    this.isLoading = true,
    this.error = ''
  });

  final ChapterModel? chapter;
  final MangaDetailModel? mangaDetail;
  final bool isLoading;
  final String error;

  ChapterScreenState copyWith({
    ChapterModel? chapter,
    MangaDetailModel? mangaDetail,
    bool? isLoading,
    String? error,
  }) {
    return ChapterScreenState(
      chapter: chapter ?? this.chapter,
      mangaDetail: mangaDetail ?? this.mangaDetail,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [chapter, mangaDetail, isLoading, error];
}
