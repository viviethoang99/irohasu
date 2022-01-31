part of 'list_manga_bloc.dart';

enum ListMangaScreenStatus { initial, success, failure }

class ListMangaState extends Equatable {
  const ListMangaState({
    this.status = ListMangaScreenStatus.initial,
    this.listManga = const <MangaModel>[],
    this.hasReachedMax = false,
    this.page = 0,
  });

  final ListMangaScreenStatus status;
  final List<MangaModel> listManga;
  final bool hasReachedMax;
  final int page;

  ListMangaState copyWith({
    ListMangaScreenStatus? status,
    List<MangaModel>? listManga,
    bool? hasReachedMax,
    int? page,
  }) {
    return ListMangaState(
      status: status ?? this.status,
      listManga: listManga ?? this.listManga,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [
        status,
        listManga,
        hasReachedMax,
        page,
      ];
}