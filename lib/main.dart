import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/application/app_widget.dart';
import 'src/core/dependency_injection/dependency_injection.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await registerDependencies();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ).then((value) => runApp(AppWidget()));
}
