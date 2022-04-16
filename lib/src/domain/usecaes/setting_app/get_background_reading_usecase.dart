import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../repositories/i_setting_app_repository.dart';

@lazySingleton
class GetBackgroundReadingUseCase implements UseCase<String, void> {
  GetBackgroundReadingUseCase(this.repository);

  final ISettingAppRepository repository;

  @override
  Future<Either<Failure, String>> call({void params}) {
    return repository.getBackgroundReading();
  }
}
