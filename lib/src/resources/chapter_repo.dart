import 'package:dio/dio.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart' as dom;

import '../../src/models/chapter_model.dart';
import '../../src/service/base_service.dart';

class ChapterRepo extends BaseService {
  Future<ChapterModel> getDataChapter(String endpoint) async {
    final Response response = await request(url: endpoint);
    final document = parse(response.data);
    final responseData = document.querySelectorAll('#content > img');
    final List<ChapterImage> listImage = getChapter(responseData);
    final chapter = ChapterModel(
      chapterEndpoint: endpoint,
      title: document.querySelector('header > h1').toString(),
      listImageChapter: listImage,
    );
    // print('breakpoint here');
    return chapter;
  }

  List<ChapterImage> getChapter(List<dom.Element> elementList) {
    List<ChapterImage> getData = <ChapterImage>[];
    for (int i = 0; i < elementList.length; i++) {
      getData.add(
        ChapterImage(
            number: i,
            chapterImageLink: elementList[i].attributes['src'].toString()),
      );
    }
    return getData;
  }
}
