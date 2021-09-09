import 'package:equatable/equatable.dart';
import 'package:html/dom.dart';
import '../extensions/iterable_extension.dart';

class ChapterModel extends Equatable {
  ChapterModel({
    this.id,
    this.title,
    this.endpoint,
    this.listImage,
    this.mangaEndpoint,
    this.nameManga,
    this.totalImage,
  });

  factory ChapterModel.fromData(Document data, String endpoint) {
    final responseData = data.querySelectorAll('#content > img');
    final responseLink = data.querySelectorAll('.linkchapter > a');
    return ChapterModel(
      id: endpoint.substring(1),
      title: data.querySelector('header > h1')?.text,
      endpoint: endpoint,
      totalImage: 30,
      mangaEndpoint: responseLink[3].attributes['href'],
      listImage: List<ChapterImage>.from(
        responseData.mapIndexed<ChapterImage>(
          (image, index) => ChapterImage.fromData(image, index),
        ),
      ),
      nameManga: data
          .querySelector('div.al-c.linkchapter.mt20 > a.mr10.ml10')
          ?.attributes['title']
          ?.replaceFirst('truyện tranh', '')
          .trim(),
    );
  }

  final String? id;
  final String? title;
  final String? endpoint;
  final String? mangaEndpoint;
  final String? nameManga;
  final int? totalImage;
  final List<ChapterImage>? listImage;

  @override
  List<Object?> get props => [
        id,
        title,
        endpoint,
        mangaEndpoint,
        nameManga,
        totalImage,
        listImage,
      ];
}

class ChapterImage extends Equatable {
  ChapterImage({required this.chapterImageLink, required this.number});

  factory ChapterImage.fromData(Element data, int index) {
    return ChapterImage(
      number: index,
      chapterImageLink: data.attributes['src'],
    );
  }

  final String? chapterImageLink;
  final int? number;

  @override
  List<Object?> get props => [chapterImageLink, number];
}
