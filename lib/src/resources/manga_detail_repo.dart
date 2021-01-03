import 'package:dio/dio.dart' as dio;
import 'package:html/parser.dart';
import 'package:html/dom.dart' as dom;

import '../../src/constants/base_content.dart';
import '../../src/models/manga_detail_model.dart';
import '../../src/service/base_service.dart';

class MangaDetailRepo extends BaseService {
  Future<MangaDetail> getMangaDetail(String endpoint) async {
    dio.Response response = await request(url: endpoint);
    final document = parse(response.data);
    final description = document.querySelectorAll('div.description > p');
    final getTotalLike =
        document.querySelector('.total-vote').attributes['ng-init'].toString();
    final countLike = countTotalLike(getTotalLike);
    final getAuthor =
        findElement(description, 'Tác giả')?.querySelectorAll('a');
    // get chapter
    final getListChapters = document.querySelectorAll('#list-chapters > p');
    final urlThumb =
        document.querySelector('.thumbnail img').attributes['src'].toString();
    final title = document
        .querySelector('Title')
        .text
        .replaceFirst('| BlogTruyen.Com', '')
        .trim();
    final chapter = getChapter(getListChapters, title);
    final mangaDetail = MangaDetail(
      title: title,
      thumb: urlThumb,
      endpoint: endpoint,
      author: getAuthor != null ? getElement(getAuthor) : null,
      status: findElement(description, Content.status)
          .querySelector('span.color-red')
          .text,
      description:
          document.querySelector('div.detail > div.content').text.trim(),
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
    var keyValuePairs = value.split(';');
    final map = <String, String>{};
    for (var pair in keyValuePairs) {
      final entry = pair.split('=');
      map['${entry[0].trim()}'] = entry[1].trim();
    }
    return map;
  }

  List<String> getElement(List<dom.Element> element) {
    final author = element.map((e) {
      return e.text;
    }).toList();
    return author;
  }

  List<ChapterList> getChapter(List<dom.Element> elementList, String title) {
    final chapterList = elementList.map((element) {
      return ChapterList(
          chapterTitle: element
              .querySelector('.title > a')
              .text
              .replaceAll(title, '')
              .trim(),
          chapterEndpoint:
              element.querySelector('.title > a').attributes['href'].toString(),
          chapterUpload: element.querySelector('.publishedDate').text);
    }).toList();
    return chapterList;
  }
}
