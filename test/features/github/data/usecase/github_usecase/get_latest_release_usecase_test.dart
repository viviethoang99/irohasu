import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irohasu/core/core.dart';
import 'package:irohasu/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late GithubRepository repository;
  late GetLatestReleaseUseCase usecase;

  setUp(() {
    repository = _MockGithubRepository();
    usecase = GetLatestReleaseUseCase(repository);
  });
  final app = _FakeReleaseApp();
  test('should return release app when get success', () async {
    // arrange
    when(repository.getLatestRelease).thenAnswer((_) async => Right(app));
    // act
    final result = await usecase.call();
    // assert
    expect(result, equals(Right(app)));
  });

  test('should return failure when get failed', () async {
    // arrange
    when(repository.getLatestRelease)
        .thenAnswer((_) async => Left(ServerFailure()));
    // act
    final result = await usecase.call();
    // assert
    expect(result.isLeft(), isTrue);
  });
}

class _MockGithubRepository extends Mock implements GithubRepository {}

class _FakeReleaseApp extends Fake implements ReleaseApp {}

