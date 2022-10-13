import 'package:html/dom.dart';
import 'package:isar/isar.dart';

import '../../../domain/entities/genres.dart';

part 'genres_dto.g.dart';

typedef GenresDtoList = List<GenresDto>;

@embedded
class GenresDto {
  const GenresDto({
    this.name,
    this.url,
  });

  factory GenresDto.fromHTML(Element data) => GenresDto(
        name: data.text,
        url: data.attributes['href'],
      );

  Genres toModel() {
    return Genres(
      name: name,
      url: url,
    );
  }

  final String? name;
  final String? url;
}

extension GenresDtoListX on GenresDtoList {
  ListGenres toListGenres() => map((genres) => genres.toModel()).toList();
}
