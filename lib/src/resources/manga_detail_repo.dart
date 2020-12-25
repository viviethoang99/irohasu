import 'dart:async';

import 'package:dio/dio.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart' as dom;

import '../../src/models/manga_detail_model.dart';
import '../../src/service/base_service.dart';

class MangaDetailRepo extends BaseService {
  Future<MangaDetail> getMangaDetail(String endpoint) async {
    final Response response =
        await request(url: endpoint);
    final document = parse(response.data);
    final List<dom.Element> description =
        document.querySelectorAll('div.description > p');
    final getTotalLike = document
        .getElementsByClassName('total-vote')[0]
        .attributes['ng-init']
        .toString();
    Map<String, String> countLike = countTotalLike(getTotalLike);
    final List getAuthor =
        findElement(description, "Tác giả").querySelectorAll("a");
    // get chapter
    final List getListChapters =
        document.querySelectorAll('#list-chapters > p');
    final urlThumb = document.querySelector('.thumbnail img').attributes['src'].toString();
    final title = document.querySelector('Title').text.replaceFirst('| BlogTruyen.Com', "").trim();
    // get List chapter
    final List<ChapterList> chapter = getChapter(getListChapters, title);

    final mangaDetail = MangaDetail(
      title: title,
      thumb: urlThumb,
      endpoint: endpoint,
      author: getElement(getAuthor),
      status: findElement(description, "Trạng thái")
          .querySelector('span.color-red')
          .text,
      description:
          document.querySelector("div.detail > div.content").text.trim(),
      like: countLike['TotalLike'],
      dislike: countLike['TotalDisLike'],
      chapter: chapter,
    );
    return mangaDetail;
  }

  dom.Element findElement(List<dom.Element> description, String text) {
    for (var index = 0; index < description.length; index++) {
      if (description[index].text.contains(text)) {
        return description[index];
      }
    }
    return null;
  }

  Map<String, String> countTotalLike(String value) {
    List<String> keyValuePairs = value.split(";");
    final Map<String, String> map = {};

    for (String pair in keyValuePairs) {
      List<String> entry = pair.split("=");
      map['${entry[0].trim()}'] = entry[1].trim();
    }
    return map;
  }

  List<String> getElement(List<dom.Element> element) {
    final List<String> author = [];
    for (var i = 0; i < element.length; i++) {
      author.add(element[i].text);
    }
    return author;
  }

  List<ChapterList> getChapter(List<dom.Element> elementList, String title) {
    List<ChapterList> getData = <ChapterList>[];
    for (var element in elementList) {
      getData.add(
        ChapterList(
          chapterTitle: element.querySelector('.title > a').text.replaceAll(title, " ").trim(),
          chapterEndpoint:
              element.querySelector('.title > a').attributes['href'].toString(),
          chapterUpload: element.querySelector('.publishedDate').text,
        ),
      );
    }
    return getData;
  }
}
