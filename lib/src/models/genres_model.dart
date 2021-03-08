import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';


part 'genres_model.g.dart';

@HiveType(typeId: 2)
class Genres extends Equatable {
  Genres({this.genreName, this.urlGenre});

  factory Genres.fromJson({Map<String, dynamic> json}) => Genres(
    genreName: json['titleGenre'] as String,
    urlGenre: json['urlGenre'] as String,
  );

  @HiveField(0)
  final String genreName;
  @HiveField(1)
  final String urlGenre;

  @override
  List<Object> get props => [];
}