part of 'manga_info_cubit.dart';

enum MangaInfoAction {
  none,
  changeChap,
}

class MangaInfoState extends Equatable {
  const MangaInfoState(
    this.nameManga,
    this.listChapter,
    this.endpoint,
    this.action,
  );

  final String nameManga;
  final ListChapter listChapter;
  final String endpoint;
  final MangaInfoAction action;

  MangaInfoState copyWith({
    String? nameManga,
    ListChapter? listChapter,
    String? endpoint,
    MangaInfoAction? action,
  }) =>
      MangaInfoState(
        nameManga ?? this.nameManga,
        listChapter ?? listChapter,
        endpoint ?? this.endpoint,
        action ?? this.action,
      );

  @override
  List<Object?> get props => [nameManga, listChapter, endpoint, action];
}
