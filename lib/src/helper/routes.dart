import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:irohasu/src/ui/chapter_screens/chapter_screen.dart';

import '../../src/ui/detail_screens/manga_detail_screen.dart';
import '../../src/ui/home_screens/recent_screen.dart';

MaterialPageRoute pageRoute({RouteSettings routeSettings, Widget builder, bool isFullscreen = false}) {
  return MaterialPageRoute(
    builder: (BuildContext context) => builder,
    settings: routeSettings,
    fullscreenDialog: isFullscreen,
  );
}

Route generateRoute(RouteSettings routeSettings) {
  final args = routeSettings.arguments;
  switch (routeSettings.name) {
    case RecentScreen.routeName:
      return pageRoute(routeSettings: routeSettings, builder: RecentScreen());
    case MangaDetailScreen.routeName:
      return pageRoute(
          routeSettings: routeSettings,
          builder: MangaDetailScreen(endpoint: args));
    case ChapterScreen.routeName:
      return pageRoute(
          routeSettings: routeSettings,
          builder: ChapterScreen(endpoint: args));
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for app')),
        ),
      );
  }
}
