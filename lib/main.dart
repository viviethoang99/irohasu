import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/core.dart';
import 'src/application/app_widget.dart';
import 'src/config/bloc/bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await registerDependencies();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  BlocOverrides.runZoned(
    () => runApp(const AppWidget()),
    blocObserver: AppBlocObserver(),
  );
}
