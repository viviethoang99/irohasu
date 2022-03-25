import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/failures.dart';
import '../../core/usecase/usecase.dart';

import '../../data/model/setting_model/setting_app.dart';
import '../repositories/i_setting_app_repository.dart';

@lazySingleton
class SetDefaultSettingAppUseCase implements UseCase<SettingApp, void> {
  SetDefaultSettingAppUseCase(this.repository);

  final ISettingAppRepository repository;

  @override
  Future<Either<Failure, SettingApp>> call({void params}) {
    return repository.setDefault();
  }
}
