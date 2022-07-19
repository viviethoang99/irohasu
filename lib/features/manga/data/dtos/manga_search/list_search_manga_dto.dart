import '../../../../../core/core.dart';
import '../dtos.dart';

class ListSearchMangaDto {
  const ListSearchMangaDto({required this.listManga});

  factory ListSearchMangaDto.fromMap(DartSoup data) {
    final item = data.findAll('div.list span.tiptip.fs-12.ellipsis');
    final image = data.findAll('div.list-manga-bycate img');

    return ListSearchMangaDto(
      listManga: List<MangaSearchDto>.from(
        item.mapIndexed<MangaSearchDto>(
          (manga, index) => MangaSearchDto.fromHtml(
            manga,
            image[index].attributes['src'] ?? '',
          ),
        ),
      ),
    );
  }

  final List<MangaSearchDto> listManga;
}
