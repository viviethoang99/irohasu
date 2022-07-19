import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../entities/entities.dart';
import '../../repository/i_github_repository.dart';

@lazySingleton
class GetLatestReleaseUseCase implements UseCase<ReleaseApp, void> {
  const GetLatestReleaseUseCase(this._repository);

  final IGithubRepository _repository;

  @override
  Future<Either<Failure, ReleaseApp>> call({void params}) {
    return _repository.getLatestRelease();
  }
}
