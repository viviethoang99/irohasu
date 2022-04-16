import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irohasu/src/domain/repositories/i_favorite_repository.dart';
import 'package:irohasu/src/domain/usecaes/favorite_manga/change_status_favorite_usercase.dart';
import 'package:mocktail/mocktail.dart';

class MockFavoriteRepository extends Mock implements IFavoriteRepository {}

void main() {
  late MockFavoriteRepository repository;
  late ChangeStatusFavoriteUseCase usecase;

  setUp(() {
    repository = MockFavoriteRepository();
    usecase = ChangeStatusFavoriteUseCase(repository);
  });

  const params = ChangeStatusFavoriteParams(
    id: '1604',
    isFavorite: true,
  );

  test('should return list of manga when requested with offset', () async {
    // arrange
    when(() => repository.changeStatusFavorite(params: params))
        .thenAnswer((_) => const Right(null));
    // act
    final result = await usecase(params: params);
    // assert
    expect(result, equals(const Right(null)));
  });
}
