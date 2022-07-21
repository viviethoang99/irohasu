part of 'history_screen_bloc.dart';

class HistoryScreenState extends Equatable {
  const HistoryScreenState({
    this.listManga = const <MangaDetail>[],
  });

  final List<MangaDetail> listManga;

  HistoryScreenState copyWith({List<MangaDetail>? listManga}) {
    return HistoryScreenState(
      listManga: listManga ?? this.listManga,
    );
  }

  @override
  List<Object?> get props => [listManga];
}
