import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/error.dart';
import '../../dtos/chapter/chapter_dto.dart';

/// A class responsible for fetching chapter data from website using an
abstract class IChapterApiSource {
  /// Returns an list [ChapterDto] by fetching it from the website
  /// HTTP call with the [endpoint].
  Future<Either<Failure, ChapterDto>> getChapter(String endpoint);
}

@injectable
class ChapterApiSource implements IChapterApiSource {
  const ChapterApiSource(this._dio);

  final Dio _dio;

  @override
  Future<Either<Failure, ChapterDto>> getChapter(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      final document = parse(response.data);
      return Right(ChapterDto.fromHTML(document, endpoint));
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
