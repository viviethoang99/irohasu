part of 'manga_detail_bloc.dart';

enum MangaDetailStatus { loading, failed, success }

final class MangaDetailState extends Equatable {
  const MangaDetailState({
    this.mangaDetail,
    this.chapterReading = const [],
    this.status = MangaDetailStatus.loading,
  });

  final MangaDetail? mangaDetail;
  final MangaDetailStatus status;
  final List<String> chapterReading;

  MangaDetailState copyWith({
    MangaDetail? mangaDetail,
    List<String>? chapterReading,
    MangaDetailStatus? status,
  }) {
    return MangaDetailState(
      mangaDetail: mangaDetail ?? this.mangaDetail,
      chapterReading: chapterReading ?? this.chapterReading,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        mangaDetail,
        chapterReading,
        status,
      ];
}
