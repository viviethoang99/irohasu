import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/core.dart';
import '../../../domain/entities/manga_detail.dart';
import '../../dtos/dtos.dart';
import '../../model/search_manga_model.dart';

typedef ListMangaPageRemote = Either<Failure, MangaPageDtoList>;

typedef ListMangaSearchRemote = Either<Failure, MangaSearchDtoList>;

typedef MangaDetailRemote = Either<Failure, MangaDetailDto>;

/// A class responsible for fetching manga data from website using an HTTP call
abstract class IMangaApiSource {
  /// Returns [MangaPageDtoList] by fetching it from the API with
  /// the [page].
  Future<ListMangaPageRemote> findMangaByPage({int? page});

  /// Returns [MangaPageDtoList] by fetching it from the API with
  /// the [query].
  Future<ListMangaSearchRemote> findMangaByQuery({String? query});

  /// Returns an list [MangaDetail] by fetching it from the website
  /// with the [endpoint].
  Future<MangaDetailRemote> findMangaDetail(String endpoint);
}

@Injectable(as: IMangaApiSource)
class MangaApiSource implements IMangaApiSource {
  const MangaApiSource(this._dio);

  final Dio _dio;

  @override
  Future<ListMangaPageRemote> findMangaByPage({int? page}) async {
    try {
      final response = await _dio.get('/page-$page');
      final document = parse(response.data);
      final responseData = document.getElementsByClassName('storyitem');
      final listManga = List<MangaPageDto>.from(
        responseData.map<MangaPageDto>(MangaPageDto.listManga),
      );
      return Right(listManga);
    } on Exception {
      return Left(ServerFailure());
    }
  }

  @override
  Future<ListMangaSearchRemote> findMangaByQuery({String? query}) async {
    try {
      final response = await _dio.get('/timkiem/nangcao/$query');
      final document = parse(response.data);
      var data = ListSearchMangaDto.fromMap(document);
      return Right(data.listManga);
    } on Exception {
      return Left(ServerFailure());
    }
  }

  @override
  Future<MangaDetailRemote> findMangaDetail(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      final document = parse(response.data);
      final mangaDetail = MangaDetailDto.fromHTML(document, endpoint);
      return Right(mangaDetail);
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
