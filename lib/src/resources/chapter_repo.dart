import 'package:dio/dio.dart' as dio;
import 'package:html/parser.dart';
import 'package:html/dom.dart' as dom;

import '../../src/models/chapter_model.dart';
import '../../src/service/base_service.dart';

class ChapterRepo extends BaseService {
  Future<ChapterModel> getDataChapter(String endpoint) async {
    dio.Response response = await request(url: endpoint);
    final document = parse(response.data);
    final responseData = document.querySelectorAll('#content > img');
    final listImage = getChapter(responseData);
    final chapter = ChapterModel(
      chapterEndpoint: endpoint,
      title: document.querySelector('header > h1').toString(),
      listImageChapter: listImage,
    );
    // print('breakpoint here');
    return chapter;
  }

  List<ChapterImage> getChapter(List<dom.Element> elementList) {
    final getData = <ChapterImage>[];
    for (var i = 0; i < elementList.length; i++) {
      getData.add(
        ChapterImage(
            number: i,
            chapterImageLink: elementList[i].attributes['src'].toString()),
      );
    }
    return getData;
  }
}
