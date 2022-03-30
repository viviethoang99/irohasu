import 'package:hive/hive.dart';
import 'package:html/dom.dart';

part 'genres_model.g.dart';

@HiveType(typeId: 2)
class Genres {
  const Genres({this.genreName, this.urlGenre});

  factory Genres.fromHTML({required Element data}) => Genres(
        genreName: data.text,
        urlGenre: data.attributes['href'],
      );

  @HiveField(0)
  final String? genreName;
  @HiveField(1)
  final String? urlGenre;
}
