import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irohasu/core/core.dart';
import 'package:irohasu/features/github/github.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late IGithubApiSource apiSource;
  late IGithubLocalDataSource localDataSource;
  late GithubRepository repository;

  setUp(() {
    apiSource = _MockGithubApiSource();
    localDataSource = _MockGithubLocal();
    repository = GithubRepository(apiSource, localDataSource);
  });

  group('getLatestRelease', () {
    test('should return right when success', (() async {
      final app = _FakeReleaseApp();
      final dto = _FakeReleaseAppDto(app);

      when(apiSource.getLatestRelease).thenAnswer((_) async => right(dto));

      final result = await repository.getLatestRelease();

      expect(result, right(app));
    }));

    test('should return left when loading failed', (() async {
      final error = ServerFailure();
      when(apiSource.getLatestRelease).thenAnswer((_) async => left(error));

      final result = await repository.getLatestRelease();

      expect(result, left(error));
    }));
  });

  group('getReleases', () {
    test('should return right when success', (() async {
      final app = <ReleaseApp>[_FakeReleaseApp()];
      final dtos = <ReleaseAppDto>[_FakeReleaseAppDto(app.first)];

      when(apiSource.getReleases).thenAnswer((_) async => right(dtos));

      final result = await repository.getReleases();

      expect(result.isRight(), isTrue);
    }));

    test('should return left when loading failed', (() async {
      final error = ServerFailure();
      when(apiSource.getReleases).thenAnswer((_) async => left(error));

      final result = await repository.getReleases();

      expect(result.isLeft(), isTrue);
    }));
  });
}

class _MockGithubApiSource extends Mock implements IGithubApiSource {}

class _MockGithubLocal extends Mock implements IGithubLocalDataSource {}

class _FakeReleaseApp extends Fake implements ReleaseApp {}

class _FakeReleaseAppDto extends Fake implements ReleaseAppDto {
  _FakeReleaseAppDto(this.item);

  final ReleaseApp item;

  @override
  ReleaseApp toEntity() => item;
}
