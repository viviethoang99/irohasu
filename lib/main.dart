import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'core/core.dart';
import 'src/application/app_widget.dart';
import 'src/config/bloc/bloc.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await registerDependencies();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  final path = await getApplicationDocumentsDirectory();
  print(path);
  BlocOverrides.runZoned(
    () => runApp(const AppWidget()),
    blocObserver: AppBlocObserver(),
  );
}
