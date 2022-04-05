import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irohasu/env.dart';
import 'package:irohasu/src/data/datasource/remote/manga_services.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helper/dio_helpers.dart';
import 'list_manga_reponse_fixture.dart';

void main() {
  late MangaService _service;
  late Dio dio;

  setUp(() {
    dio = MockDio();
    _service = MangaService();
  });

  group('Fetch data list manga', () {
    final tPage = 1;
    test('should return list manga when success', () async {
      when(() => dio.get('${ENV.webPage}/page-$tPage')).thenAnswer(
        (_) async => FakeResponse.success(listMangaResponse),
      );
      final result = await _service.fetchListManga(page: 1);
      expect(result.isNotEmpty, isTrue);
    });

    test('Should return an empty array when throw error', () async {
      // When
      when(() => dio.get('${ENV.webPage}/page-$tPage')).thenThrow(
       FakeDioError(DioErrorType.cancel),
      );
      // Act
      final result = await _service.fetchListManga(page: 1);
      // Result
      expect(result.isEmpty, isTrue);
    });
  });
}
