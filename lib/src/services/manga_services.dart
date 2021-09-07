import 'package:html/parser.dart';

import '../models/manga_detail_model.dart';
import '../models/manga_list_model.dart';
import '../models/search_manga_model.dart';
import 'base_service.dart';

class MangaService extends BaseService {
  Future<List<MangaModel>> fetchListManga({int? page}) async {
    final response = await request(url: '/page-$page');
    final document = parse(response!.data);
    final responseData = document.getElementsByClassName('storyitem');
    var data = List<MangaModel>.from(
      responseData.map<MangaModel>((manga) => MangaModel.listManga(manga)),
    );
    return data;
  }

  Future<List<MangaModel>> getDataResult({String? query}) async {
    final response = await (request(url: '/timkiem/nangcao/$query'));
    final document = parse(response!.data);
    var data = ListSearchMangaModel.fromMap(document);
    return data.listManga;
  }

  Future<MangaDetailModel?> fetchMangaDetail(String endpoint) async {
    try {
      final response = await request(url: endpoint);
      final document = parse(response!.data);
      return MangaDetailModel.fromMap(document, endpoint);
    } catch (e) {
      print(e);
    }
  }
}
