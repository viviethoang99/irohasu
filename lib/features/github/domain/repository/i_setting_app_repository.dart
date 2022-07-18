import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';

abstract class ISettingAppRepository {
  Future<Either<Failure, String>> getdownloadPath();
}
