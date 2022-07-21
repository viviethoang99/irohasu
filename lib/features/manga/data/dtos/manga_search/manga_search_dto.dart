import 'package:html/dom.dart';

import '../../../domain/entities/manga.dart';

typedef MangaSearchDtoList = List<MangaSearchDto>;

class MangaSearchDto {
  const MangaSearchDto({
    this.idManga,
    this.title,
    this.thumbnailUrl,
    this.endpoint,
  });

  factory MangaSearchDto.fromHtml(Element data, String urlImage) {
    final linkHref = data.querySelector('a');
    return MangaSearchDto(
      idManga: linkHref?.attributes['href']?.split('/')[1],
      title: linkHref?.text,
      thumbnailUrl: urlImage,
      endpoint: linkHref?.attributes['href'],
    );
  }

  Manga toEntity() {
    return Manga(
      idManga: idManga ?? '',
      title: title ?? '',
      thumbnailUrl: thumbnailUrl ?? '',
      endpoint: endpoint ?? '',
    );
  }

  final String? idManga;
  final String? title;
  final String? thumbnailUrl;
  final String? endpoint;
}

extension MangaSearchDtoListX on MangaSearchDtoList {
  ListManga toEntities() => map((genres) => genres.toEntity()).toList();
}

