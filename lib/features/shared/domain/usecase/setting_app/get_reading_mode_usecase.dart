import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../repositories/i_setting_app_repository.dart';

@lazySingleton
class GetReadingModeUseCase implements UseCase<String, void> {
  GetReadingModeUseCase(this.repository);

  final ISettingAppRepository repository;

  @override
  Future<Either<Failure, String>> call({void params}) {
    return repository.getReadingMode();
  }
}
