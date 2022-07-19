import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../github.dart';


@Injectable(as: IGithubRepository)
class GithubRepository implements IGithubRepository {
  GithubRepository(this._apiSource);

  final IGithubApiSource _apiSource;

  @override
  Future<Either<Failure, ReleaseApp>> getLatestRelease() async {
    final response = await _apiSource.getLatestRelease();
    return response.fold(
      (l) => Left(ServerFailure()),
      (r) => Right(r.toEntity()),
    );
  }

  @override
  Future<Either<Failure, List<ReleaseApp>>> getReleases() async {
    final response = await _apiSource.getReleases();
    return response.fold(
      (l) => Left(ServerFailure()),
      (r) => Right(r.toEntities()),
    );
  }
}
