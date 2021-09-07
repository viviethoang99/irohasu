import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:html/dom.dart';
import '../config/base_content.dart';
import '../helper/manga_detail_helper.dart';

import 'chapter_item_model.dart';
import 'genres_model.dart';

part 'manga_detail_model.g.dart';

@HiveType(typeId: 0)
class MangaDetailModel extends Equatable {
  MangaDetailModel({
    this.idManga,
    this.title,
    this.isFavorite,
    this.status,
    this.listChapter,
    this.author,
    this.like,
    this.dislike,
    this.description,
    this.endpoint,
    this.thumbnailUrl,
    this.listGenres,
  });

  factory MangaDetailModel.fromMap(Document data, String endpoint) {
    final description = data.querySelectorAll('div.description > p');
    final getTotalLike =
        data.querySelector('.total-vote')?.attributes['ng-init'];
    final countLike = MangaDetailHelper.countTotalLike(getTotalLike);
    final getAuthor = MangaDetailHelper.findElement(description, 'Tác giả')
        ?.querySelectorAll('a');
    final getListChapters = data.querySelectorAll('#list-chapters > p');
    final getListGenres = MangaDetailHelper.findElement(description, 'Thể loại')
        ?.querySelectorAll('span a');
    final urlThumb = data.querySelector('.thumbnail img')?.attributes['src'];
    final title = data
        .querySelector('Title')!
        .text
        .replaceFirst('| BlogTruyen.Com', '')
        .trim();
    return MangaDetailModel(
      idManga: endpoint.split('/')[1],
      title: title,
      thumbnailUrl: urlThumb,
      endpoint: endpoint,
      author: MangaDetailHelper.getElement(getAuthor),
      description: data.querySelector('div.detail > div.content')?.text.trim(),
      like: countLike['TotalLike'],
      dislike: countLike['TotalDisLike'],
      status: MangaDetailHelper.findElement(description, ConstantStrings.status)
          ?.querySelector('span.color-red')
          ?.text,
      listChapter: List<ChapterItem>.from(getListChapters.map<ChapterItem>(
        (manga) => ChapterItem.fromMap(data: manga),
      )),
      listGenres: List<Genres>.from(
        getListGenres!.map<Genres>((manga) => Genres.fromData(data: manga)),
      ),
    );
  }

  MangaDetailModel copyWith({
    String? idManga,
    String? title,
    String? thumbnailUrl,
    String? endpoint,
    String? description,
    String? dislike,
    String? like,
    String? status,
    String? author,
    List<ChapterItem>? listChapter,
    bool? isFavorite,
    List<String>? listChapRead,
    List<String>? listDownload,
    List<Genres>? listGenres,
  }) {
    return MangaDetailModel(
      idManga: idManga ?? this.idManga,
      title: title ?? this.title,
      isFavorite: isFavorite ?? this.isFavorite,
      status: status ?? this.status,
      listChapter: listChapter ?? this.listChapter,
      author: author ?? this.author,
      like: like ?? this.like,
      dislike: dislike ?? this.dislike,
      description: description ?? this.description,
      endpoint: endpoint ?? this.endpoint,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      listGenres: listGenres ?? this.listGenres,
    );
  }

  @HiveField(0)
  final String? idManga;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? thumbnailUrl;
  @HiveField(3)
  final String? endpoint;
  @HiveField(4)
  final String? description;
  @HiveField(5)
  final String? dislike;
  @HiveField(6)
  final String? like;
  @HiveField(7)
  final String? status;
  @HiveField(8)
  final String? author;
  @HiveField(9)
  final List<ChapterItem>? listChapter;
  @HiveField(10)
  final bool? isFavorite;
  @HiveField(11)
  final List<String>? listChapRead = [];
  @HiveField(12)
  final List<String>? listDownload = [];
  @HiveField(13)
  final List<Genres>? listGenres;

  @override
  List<Object?> get props => [
        idManga,
        title,
        isFavorite,
        status,
        listChapter,
        author,
        like,
        dislike,
        description,
        endpoint,
        thumbnailUrl,
        listGenres,
      ];
}
