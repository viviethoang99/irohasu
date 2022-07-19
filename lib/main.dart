import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'application/app_widget.dart';
import 'config/bloc/bloc.dart';
import 'core/core.dart';
import 'core/utils/tool_methods.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initialized();
  BlocOverrides.runZoned(
    () => runApp(const AppWidget()),
    blocObserver: AppBlocObserver(),
  );
}

Future<void> _initialized() async {
  await Hive.initFlutter();
  await registerDependencies();
  await FlutterDownloader.initialize(debug: true);
  await FlutterDownloader.registerCallback(ToolMethods.downloadCallback);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
