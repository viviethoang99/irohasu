part of 'chapter_screen_cubit.dart';

class ChapterScreenState extends Equatable {
  const ChapterScreenState({
    this.chapter,
    this.isLoading = true,
    this.error = '',
  });

  final Chapter? chapter;
  final bool isLoading;
  final String error;

  ChapterScreenState copyWith({
    Chapter? chapter,
    bool? isLoading,
    String? error,
  }) {
    return ChapterScreenState(
      chapter: chapter ?? this.chapter,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  String get nameChapter =>
      chapter?.title?.replaceAll(chapter!.nameManga!, '').trim().capitalize() ??
      '';

  @override
  List<Object?> get props => [
        chapter,
        isLoading,
        error,
      ];
}
