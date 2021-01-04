import 'package:html/parser.dart';
import 'package:dio/dio.dart' as dio;

import 'package:irohasu/src/models/search_model.dart';
import 'package:irohasu/src/service/base_service.dart';

class SearchRepo extends BaseService {
  Future<List<SearchModel>> getDataResult({String query}) async {
    dio.Response response;
    response = await request(url: '/timkiem/nangcao/1/0/-1/-1?txt=$query');
    final document = parse(response.data);
    final listItem =
        document.querySelectorAll('div.list span.tiptip.fs-12.ellipsis');
    final image = document.querySelectorAll('div.list-manga-bycate img');
    var indexImage = 0;
    final mangaDetail = listItem.map((item) {
      final urlImage = image[indexImage].attributes['src'];
      indexImage += 1;
      return SearchModel(
        title: item.querySelector('a').text,
        thumbnailUrl: urlImage,
        setUrlWithoutDomain: item.querySelector('a').attributes['href'],
      );
    }).toList();
    return mangaDetail;
  }
}
