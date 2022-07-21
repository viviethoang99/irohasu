import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../github.dart';

@lazySingleton
class GetDownloadPathUseCase implements UseCase<void, String> {
  GetDownloadPathUseCase(this.repository);

  final IGithubRepository repository;

  @override
  Future<Either<Failure, String>> call({void params}) {
    return repository.getdownloadPath();
  }
}
