import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irohasu/src/data/datasource/remote/manga_api_source.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helper/dio_helpers.dart';
import 'list_manga_reponse_fixture.dart';

void main() {
  late MangaApiSource _service;
  late Dio dio;

  setUp(() {
    dio = MockDio();
    _service = MangaApiSource(dio);
  });

  group('Find manga by page', () {
    final tPage = 1;
    test('should return list manga when success', () async {
      when(() => dio.get('/page-$tPage')).thenAnswer(
        (_) async => FakeResponse.success(listMangaResponse),
      );
      final result = await _service.findMangaByPage(page: 1);
      expect(result.isRight(), isTrue);
    });

    test('Should return an empty array when throw error', () async {
      // When
      when(() => dio.get('/page-$tPage')).thenThrow(
       FakeDioError(DioErrorType.cancel),
      );
      // Act
      final result = await _service.findMangaByPage(page: 1);
      // Result
      expect(result.isLeft(), isTrue);
    });
  });
}
