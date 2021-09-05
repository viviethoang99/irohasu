import 'package:html/parser.dart';

import '../models/manga_list_model.dart';
import '../models/search_manga_model.dart';
import '../service/base_service.dart';

class SearchRepo extends BaseService {
  Future<List<MangaModel>?> getDataResult({String? query}) async {
    final response = await (request(url: '/timkiem/nangcao/$query'));
    final document = parse(response!.data);
    var data = ListSearchMangaModel.fromMap(document);
    return data.listManga;
  }
}
