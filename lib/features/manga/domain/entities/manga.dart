import 'package:equatable/equatable.dart';

typedef ListManga = List<Manga>;

class Manga extends Equatable {
  const Manga({
    required this.idManga,
    this.title = '',
    this.thumbnailUrl = '',
    required this.endpoint,
  });

  final String idManga;
  final String title;
  final String thumbnailUrl;
  final String endpoint;

  @override
  List<Object?> get props => [title, title, thumbnailUrl, endpoint];
}
