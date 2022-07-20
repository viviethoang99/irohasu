import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irohasu/env.dart';
import 'package:irohasu/features/github/github.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../helpers/helpers.dart';
import 'github_api_source_fixtured.dart';

void main() {
  late Dio dio;
  late GithubApiSource githubApiSource;

  setUp(() {
    dio = MockDio();
    githubApiSource = GithubApiSource(dio);
  });

  group('getLatestRelease', () {
    test('should return app release last when success', () async {
      when(() => dio.get('${ENV.uriGithub}/releases/latest'))
          .thenAnswer((_) async => FakeResponse.success(latest));

      final response = await githubApiSource.getLatestRelease();

      expect(response.isRight(), isTrue);
    });

    test('should return Failed release app is not found', () async {
      when(() => dio.get('${ENV.uriGithub}/releases/latest')).thenAnswer(
        (_) => throw FakeDioError.response(
          FakeResponse.notFound(notFoundResponse),
        ),
      );

      final response = await githubApiSource.getLatestRelease();

      expect(response.isLeft(), isTrue);
    });
  });

    group('getReleases', () {
    test('should return album when success', () async {
      when(() => dio.get('${ENV.uriGithub}/releases/'))
          .thenAnswer((_) async => FakeResponse.success(listApp));

      final response = await githubApiSource.getReleases();

      expect(response.isRight(), isTrue);
    });

    test('should return NetworkException when album is not found', () async {
      when(() => dio.get('${ENV.uriGithub}/releases/')).thenAnswer(
        (_) => throw FakeDioError.response(
          FakeResponse.notFound(notFoundResponse),
        ),
      );

      final response = await githubApiSource.getReleases();

      expect(response.isLeft(), isTrue);
    });
  });
}
