import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class MangaDetail {
  final String title,
      thumb,
      status,
      // updatedOn,
      description,
      dislike,
      like,
      endpoint;
  final List author, chapter;

  Map<String, int> theme = {
    "16+": 54,
    "18+": 45,
    "Action": 1,
    "Adult": 2,
    "Adventure": 3,
    "Anime": 4,
    "Comedy": 5,
    "Comic": 6,
    "Doujinshi": 7,
    "Drama": 49,
    "Ecchi": 48,
    "Even BT": 60,
    "Fantasy": 50,
    "Game": 61,
    "Gender Bender": 51,
    "Harem": 12,
    "Historical": 13,
    "Horror": 14,
    "Isekai/Dị Giới": 63,
    "Josei": 15,
    "Live Action": 16,
    "Magic": 46,
    "Manga": 55,
    "Manhua": 17,
    "Manhwa": 18,
    "Martial Arts": 19,
    "Mature": 20,
    "Mecha": 21,
    "Mystery": 22,
    "Nấu ăn": 56,
    "NTR": 62,
    "One shot": 23,
    "Psychological": 24,
    "Romance": 25,
    "School Life": 26,
    "Sci-fi": 27,
    "Seinen": 28,
    "Shoujo": 29,
    "Shoujo Ai": 30,
    "Shounen": 31,
    "Shounen Ai": 32,
    "Slice of Life": 33,
    "Smut": 34,
    "Soft Yaoi": 35,
    "Soft Yuri": 36,
    "Sports": 37,
    "Supernatural": 38,
    "Tạp chí truyện tranh": 39,
    "Tragedy": 40,
    "Trap": 58,
    "Trinh thám": 57,
    "Truyện scan": 41,
    "Video clip": 53,
    "VnComic": 42,
    "Webtoon": 52,
    "Yuri": 59,
  };

  MangaDetail({
    @required this.title,
    @required this.thumb,
    @required this.status,
    @required this.author,
    // @required this.updatedOn,
    @required this.description,
    @required this.dislike,
    @required this.like,
    @required this.endpoint,
    // @required this.theme,
    @required this.chapter,
  });
}

class ChapterList extends Equatable {
  final String chapterTitle;
  final String chapterEndpoint;
  final String chapterUpload;

  ChapterList({
    @required this.chapterTitle,
    @required this.chapterEndpoint,
    @required this.chapterUpload,
  });

  @override
  List<Object> get props => [chapterTitle, chapterEndpoint, chapterUpload];
}
