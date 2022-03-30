import 'package:equatable/equatable.dart';
import 'package:html/dom.dart';

class MangaModel extends Equatable {
  const MangaModel({
    this.idManga,
    this.title,
    this.thumbnailUrl,
    this.endpoint,
  });

  factory MangaModel.listManga(Element data) {
    final infoManga = data.children;
    final endpoint = infoManga.first.querySelector('a')?.attributes['href'];
    return MangaModel(
      idManga: endpoint?.split('/')[1],
      title: infoManga.first.querySelector('a')?.attributes['title'],
      thumbnailUrl: infoManga.first.querySelector('img')?.attributes['src'],
      endpoint: endpoint,
    );
  }

  factory MangaModel.listSearch(Element data, String urlImage) {
    final linkHref = data.querySelector('a');
    return MangaModel(
      idManga: linkHref?.attributes['href']?.split('/')[1],
      title: linkHref?.text,
      thumbnailUrl: urlImage,
      endpoint: linkHref?.attributes['href'],
    );
  }

  final String? idManga;
  final String? title;
  final String? thumbnailUrl;
  final String? endpoint;

  @override
  List<Object?> get props => [title, title, thumbnailUrl, endpoint];
}
