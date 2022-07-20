import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irohasu/core/core.dart';
import 'package:irohasu/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late GithubRepository repository;
  late GetDownloadPathUseCase usecase;

  setUp(() {
    repository = _MockSettingAppRepository();
    usecase = GetDownloadPathUseCase(repository);
  });

  test('should return path when get success', () async {
    const path = 'random-path';
    // arrange
    when(repository.getdownloadPath).thenAnswer((_) async => const Right(path));
    // act
    final result = await usecase.call();
    // assert
    expect(result, equals(const Right(path)));
  });

  test('should return failure when get failed', () async {
    // arrange
    when(repository.getdownloadPath)
        .thenAnswer((_) async => Left(CacheFailure()));
    // act
    final result = await usecase.call();
    // assert
    expect(result.isLeft(), isTrue);
  });
}

class _MockSettingAppRepository extends Mock implements GithubRepository {}
