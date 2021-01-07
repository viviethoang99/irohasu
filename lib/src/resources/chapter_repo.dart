import 'package:dio/dio.dart' as dio;
import 'package:html/parser.dart';
import 'package:html/dom.dart' as dom;

import '../../src/models/chapter_model.dart';
import '../../src/service/base_service.dart';

class ChapterRepo extends BaseService {
  Future<ChapterModel> getDataChapter(String endpoint) async {
    dio.Response response;
    response = await request(url: endpoint);
    final document = parse(response.data);
    final responseData = document.querySelectorAll('#content > img');
    final responseLink = document.querySelectorAll('.linkchapter > a')[3];
    final listImage = getChapter(responseData);
    final chapter = ChapterModel(
      chapterEndpoint: endpoint,
      title: document.querySelector('header > h1').text,
      listImageChapter: listImage,
      mangaDetail: responseLink.attributes['href'].toString(),
    );
    return chapter;
  }

  List<ChapterImage> getChapter(List<dom.Element> elementList) {
    var i = 0;
    final getData = elementList.map((e) {
      return ChapterImage(
          chapterImageLink: elementList[i].attributes['src'].toString(),
          number: i++,
          );
    }).toList();
    return getData;
  }
}
