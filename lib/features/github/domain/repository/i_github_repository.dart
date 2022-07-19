import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../entities/release_app.dart';

abstract class IGithubRepository {
  Future<Either<Failure, List<ReleaseApp>>> getReleases();

  Future<Either<Failure, ReleaseApp>> getLatestRelease();
}
