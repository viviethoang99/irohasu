import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/core.dart';
import '../../model/manga_detail_model.dart';
import '../../model/manga_list_model.dart';
import '../../model/search_manga_model.dart';

typedef ListMangaRemoteRepository = Either<Failure, List<MangaModel>>;

typedef MangaDetailRemoteRepository = Either<Failure, MangaDetailModel>;

/// A class responsible for fetching manga data from website using an HTTP call
abstract class IMangaApiSource {
  /// Returns an list [MangaModel] by fetching it from the API with
  /// the [page].
  Future<ListMangaRemoteRepository> findMangaByPage({int? page});

  /// Returns an list [MangaModel] by fetching it from the API with
  /// the [query].
  Future<ListMangaRemoteRepository> findMangaByQuery({String? query});

  /// Returns an list [MangaDetailModel] by fetching it from the website
  /// with the [endpoint].
  Future<MangaDetailRemoteRepository> findMangaDetail(String endpoint);
}

@Injectable(as: IMangaApiSource)
class MangaApiSource implements IMangaApiSource {
  const MangaApiSource(this._dio);

  final Dio _dio;

  @override
  Future<ListMangaRemoteRepository> findMangaByPage({int? page}) async {
    try {
      final response = await _dio.get('/page-$page');
      final document = parse(response.data);
      final responseData = document.getElementsByClassName('storyitem');
      final listManga = List<MangaModel>.from(
        responseData.map<MangaModel>(MangaModel.listManga),
      );
      return Right(listManga);
    } on Exception {
      return Left(ServerFailure());
    }
  }

  @override
  Future<ListMangaRemoteRepository> findMangaByQuery({String? query}) async {
    try {
      final response = await _dio.get('/timkiem/nangcao/$query');
      final document = parse(response.data);
      var data = ListSearchMangaModel.fromMap(document);
      return Right(data.listManga);
    } on Exception {
      return Left(ServerFailure());
    }
  }

  @override
  Future<MangaDetailRemoteRepository> findMangaDetail(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      final document = parse(response.data);
      final mangaDetail = MangaDetailModel.fromHTML(document, endpoint);
      return Right(mangaDetail);
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
