import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irohasu/features/manga/domain/usecase/list_manga/fetch_list_manga_usecase.dart';
import 'package:irohasu/features/manga/manga.dart';

import 'package:mocktail/mocktail.dart';

class MockMangaRepository extends Mock implements IMangaRepository {}

void main() {
  late MockMangaRepository mockRepository;
  late FetchListMangaUseCase usecase;

  setUp(() {
    mockRepository = MockMangaRepository();
    usecase = FetchListMangaUseCase(mockRepository);
  });

  const tPage = 1;
  final tListManga = List.generate(
    20,
    (index) => Manga(
      idManga: index.toString(),
      thumbnailUrl: 'http://irohasu_iz_bezt_girl.com',
      title: 'Irohasu',
      endpoint: 'viviethoang99/irohasu/issues',
    ),
  );

  test('should return list of manga when requested with offset', () async {
    // arrange
    when(() => mockRepository.findMangaByPage(page: tPage))
        .thenAnswer((_) async => Right(tListManga));
    // act
    final result = await usecase(params: 1);
    // assert
    expect(result, equals(Right(tListManga)));
  });
}
