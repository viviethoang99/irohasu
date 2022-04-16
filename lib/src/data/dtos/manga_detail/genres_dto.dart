import 'package:hive/hive.dart';
import 'package:html/dom.dart';

import '../../../domain/entities/genres.dart';

part 'genres_dto.g.dart';

typedef GenresDtoList = List<GenresDto>;

@HiveType(typeId: 2)
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

  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? url;
}

extension GenresDtoListX on GenresDtoList {
  ListGenres toListGenres() => map((genres) => genres.toModel()).toList();
}
