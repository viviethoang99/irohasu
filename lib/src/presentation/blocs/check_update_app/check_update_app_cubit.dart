import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../data/datasource/remote/github_api_source.dart';

part 'check_update_app_state.dart';

@injectable
class CheckUpdateAppCubit extends Cubit<CheckUpdateAppState> {
  CheckUpdateAppCubit(this.apiSource) : super(CheckUpdateAppInitial());

  final IGithubApiSource apiSource;

  Future<void> init() async {
    // final packageInfo = await PackageInfo.fromPlatform();
    // final _currentVersion = packageInfo.version;
    // await checkUpdate();
  }

  Future<void> checkUpdate() async {
    
  }
}
