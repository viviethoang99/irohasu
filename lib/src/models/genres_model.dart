import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:html/dom.dart';


part 'genres_model.g.dart';

@HiveType(typeId: 2)
class Genres extends Equatable {
  Genres({ this.genreName,  this.urlGenre});

  factory Genres.fromData({required Element data}) => Genres(
    genreName: data.text,
    urlGenre: data.attributes['href'],
  );

  @HiveField(0)
  final String? genreName;
  @HiveField(1)
  final String? urlGenre;

  @override
  List<Object?> get props => [genreName, urlGenre];
}
