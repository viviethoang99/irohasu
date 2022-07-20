import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:irohasu/features/features.dart';
import 'package:mocktail/mocktail.dart';

const String _downloadPath = 'DOWNLOAD_PATH';

void main() {
  group('$GithubLocalDataSource', () {
    late Box<String> box;
    late GithubLocalDataSource githubLocalDataSource;

    setUp(() {
      box = _MockStringBox();
      githubLocalDataSource = GithubLocalDataSource(box);
    });

    group('getdownloadPath', () {
      const value = 'randon path';
      test('should return path', () async {
        when(() => box.get(_downloadPath)).thenAnswer((_) => value);

        final result = await githubLocalDataSource.getdownloadPath();

        expect(result, value);
      });

      test('should return null when box is empty', () async {
        when(() => box.get(_downloadPath)).thenReturn(null);

        final result = await githubLocalDataSource.getdownloadPath();

        expect(result, null);
      });
    });

    group('setdownloadPath', () {
      const value = 'randon path';
      test('should return path', () async {
        when(() => box.put(_downloadPath, value))
            .thenAnswer((_) => Future.value());

        await githubLocalDataSource.setdownloadPath(value);

        verify(() => box.put(_downloadPath, value)).called(1);
      });
    });
  });
}

class _MockStringBox extends Mock implements Box<String> {}
