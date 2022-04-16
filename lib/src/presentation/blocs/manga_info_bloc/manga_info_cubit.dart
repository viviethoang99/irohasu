import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/chapter_screen/chapter_screen_params.dart';
import '../../../domain/entities/chapter_item.dart';

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
