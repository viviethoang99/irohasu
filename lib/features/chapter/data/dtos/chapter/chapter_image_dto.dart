import 'package:html/dom.dart';

import '../../../domain/entities/chapter.dart';

typedef ListPageDto = List<ChapterImageDto>;

class ChapterImageDto {
  const ChapterImageDto({
    required this.urlImage,
    required this.number,
  });

  factory ChapterImageDto.fromHTML(Element data, int index) {
    return ChapterImageDto(
      number: index,
      urlImage: data.attributes['src'],
    );
  }

  ChapterImage toModel() {
    return ChapterImage(
      number: number,
      urlImage: urlImage,
    );
  }

  final String? urlImage;
  final int? number;
}

extension ListPageDtoX on ListPageDto {
  ListPage toPages() => map((page) => page.toModel()).toList();
}
