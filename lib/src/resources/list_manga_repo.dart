import 'package:html/parser.dart';
import 'package:dio/dio.dart' as dio;

import '../../src/models/manga_model.dart';
import '../../src/service/base_service.dart';

class ListMangaRepo extends BaseService {
  Future<List<MangaModel>> getListManga({int page}) async {
    dio.Response response;
    response = await request(url: '/page-$page');
    final document = parse(response.data);
    final responseData = document.querySelectorAll('.storyitem > div.fl-l');

    final mangaDetail = responseData.map((manga) {
      return MangaModel.generalSettings(
        idManga: manga.querySelector('a').attributes['href'].split('/')[1],
        title: manga.querySelector('a').attributes['title'].toString(),
        thumbnailUrl: manga.querySelector('img').attributes['src'].toString(),
        endpoint:
            manga.querySelector('a').attributes['href'].toString(),
      );
    }).toList();
    return mangaDetail;
  }
}
