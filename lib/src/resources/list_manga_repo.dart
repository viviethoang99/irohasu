import 'package:html/parser.dart';
import 'package:dio/dio.dart' as dio;

import '../../src/models/list_manga_model.dart';
import '../../src/service/base_service.dart';

class ListMangaRepo extends BaseService {
  Future<List<ListManga>> getListManga({int page}) async {
    dio.Response response;
    response = await request(url: '/page-$page');
    final document = parse(response.data);
    final responseData = document.querySelectorAll('.storyitem > div.fl-l');

    final mangaDetail = responseData.map((manga) {
      return ListManga(
        title: manga.querySelector('a').attributes['title'].toString(),
        thumbnailUrl: manga.querySelector('img').attributes['src'].toString(),
        setUrlWithoutDomain:
            manga.querySelector('a').attributes['href'].toString(),
      );
    }).toList();
    return mangaDetail;
  }
}
