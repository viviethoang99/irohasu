import 'package:html/dom.dart';
import '../../core/extensions/extensions.dart';
import 'manga_list_model.dart';

class ListSearchMangaModel {
  const ListSearchMangaModel({required this.listManga});

  factory ListSearchMangaModel.fromMap(Document data) {
    final item = data.querySelectorAll('div.list span.tiptip.fs-12.ellipsis');
    final image = data.querySelectorAll('div.list-manga-bycate img');
    
    return ListSearchMangaModel(
      listManga: List<MangaModel>.from(
        item.mapIndexed<MangaModel>(
          (manga, index) => MangaModel.listSearch(
            manga,
            image[index].attributes['src'] ?? '',
          ),
        ),
      ),
    );
  }

  final List<MangaModel> listManga;
}