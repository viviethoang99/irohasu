import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../manga/manga.dart';
import '../../chapter.dart';

part 'manga_info_state.dart';

class MangaInfoCubit extends Cubit<MangaInfoState> {
  MangaInfoCubit(this.mangaDetail)
      : super(MangaInfoState(
          mangaDetail.name,
          mangaDetail.listChap,
          mangaDetail.endpoint,
          MangaInfoAction.none,
        ));

  final ChapterScreenParams mangaDetail;

  void changeChap(String endpoint) {
    state.copyWith(
      endpoint: endpoint,
      action: MangaInfoAction.changeChap,
    );
  }

  String get nameManga {
    return state.nameManga.length > 30
        ? '${state.nameManga.substring(0, 30)}..'
        : state.nameManga;
  }
}
