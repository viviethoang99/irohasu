import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../../../src/domain/repositories/i_setting_app_repository.dart';

@lazySingleton
class GetDownloadPathUseCase implements UseCase<void, String> {
  GetDownloadPathUseCase(this.repository);

  final ISettingAppRepository repository;

  @override
  Future<Either<Failure, String>> call({void params}) {
    return repository.getdownloadPath();
  }
}
