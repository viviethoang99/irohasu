part of 'history_screen_bloc.dart';

class HistoryScreenState extends Equatable {
  const HistoryScreenState({
    this.listManga = const <MangaDetailModel>[],
  });

  final List<MangaDetailModel> listManga;

  HistoryScreenState copyWith({List<MangaDetailModel>? listManga}) {
    return HistoryScreenState(
      listManga: listManga ?? this.listManga,
    );
  }

  @override
  List<Object?> get props => [listManga];
}
