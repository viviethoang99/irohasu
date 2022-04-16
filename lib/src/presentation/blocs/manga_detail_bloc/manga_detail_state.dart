part of 'manga_detail_bloc.dart';


abstract class MangaDetailState extends Equatable {
  const MangaDetailState();
  @override
  List<Object?> get props => [];
}

class MangaDetailLoadingState extends MangaDetailState {}

class MangaDetailSuccessState extends MangaDetailState {
  const MangaDetailSuccessState({
    required this.mangaDetail,
    this.chapterReading = const [],
  });

  final MangaDetail mangaDetail;
  final List<String> chapterReading;

  MangaDetailSuccessState copyWith({
    MangaDetail? mangaDetail,
    List<String>? chapterReading,
  }) {
    return MangaDetailSuccessState(
      mangaDetail: mangaDetail ?? this.mangaDetail,
      chapterReading: chapterReading ?? this.chapterReading,
    );
  }

  @override
  List<Object?> get props => [mangaDetail, chapterReading];
}

class MangaDetailFailureState extends MangaDetailState {
  const MangaDetailFailureState({this.msg});
  final String? msg;

  @override
  List<Object?> get props => [msg];
}
