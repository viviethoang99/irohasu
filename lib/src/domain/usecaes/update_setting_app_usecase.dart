import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../core/usecase/usecase.dart';
import '../entities/entities.dart';
import '../repositories/i_setting_app_repository.dart';

class UpdateSettingAppUseCase extends UseCase<void, UpdateSettingAppParams> {
  UpdateSettingAppUseCase(this.repository);

  final ISettingAppRepository repository;

  @override
  Future<Either<Failure, void>> call({UpdateSettingAppParams? params}) {
    return repository.changeSetting(params!);
  }
}
