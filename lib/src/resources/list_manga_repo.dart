import 'package:html/parser.dart';
import 'package:dio/dio.dart' as dio;

import '../../src/constants/base_blogtruyen.dart';
import '../../src/models/list_manga_model.dart';
import '../../src/service/base_service.dart';

class ListMangaRepo extends BaseService {
  Future<List<ListManga>> getListManga() async {
    dio.Response response = await request(url: BlogTruyen.baseUrl);
    final document = parse(response.data);
    final responseData = document.getElementsByClassName('storyitem');

    final mangaDetail = responseData.map((manga) {
      final infoManga = manga.children;
      return ListManga(
        title: infoManga[0].querySelector('a').attributes['title'].toString(),
        thumbnailUrl:
            infoManga[0].querySelector('img').attributes['src'].toString(),
        setUrlWithoutDomain:
            infoManga[0].querySelector('a').attributes['href'].toString(),
      );
    }).toList();
    return mangaDetail;
  }
}
