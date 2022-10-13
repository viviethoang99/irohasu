import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'dependency_injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$registerDependencies'
)

Future<void> registerDependencies() async {
  await $registerDependencies(getIt);
}

