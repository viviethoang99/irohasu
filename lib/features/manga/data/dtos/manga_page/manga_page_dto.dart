import 'package:html/dom.dart';

import '../../../domain/entities/manga.dart';

typedef MangaPageDtoList = List<MangaPageDto>;

class MangaPageDto {
  const MangaPageDto({
    this.idManga,
    this.title,
    this.thumbnailUrl,
    this.endpoint,
  });

  factory MangaPageDto.listManga(Element data) {
    final infoManga = data.children;
    final endpoint = infoManga.first.querySelector('a')?.attributes['href'];
    return MangaPageDto(
      idManga: endpoint?.split('/')[1],
      title: infoManga.first.querySelector('a')?.attributes['title'],
      thumbnailUrl: infoManga.first.querySelector('img')?.attributes['src'],
      endpoint: endpoint,
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

extension MangaPageDtoListX on MangaPageDtoList {
  ListManga toEntities() => map((genres) => genres.toEntity()).toList();
}
