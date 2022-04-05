import 'package:html/parser.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/core.dart';
import '../../model/manga_detail_model.dart';
import '../../model/manga_list_model.dart';
import '../../model/search_manga_model.dart';

import 'base_service.dart';

@injectable
class MangaService extends BaseService {
  Future<List<MangaModel>> fetchListManga({int? page}) async {
    try {
      final response = await request(url: '/page-$page');
      final document = parse(response!.data);
      final responseData = document.getElementsByClassName('storyitem');
      return List<MangaModel>.from(
        responseData.map<MangaModel>(MangaModel.listManga),
      );
    } on Exception catch (excaption) {
      print(excaption);
      throw ServerException();
    }
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
      return MangaDetailModel.fromHTML(document, endpoint);
    } on Exception {
      throw Exception();
    }
  }
}
