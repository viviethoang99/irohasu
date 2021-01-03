import 'package:flutter/material.dart';

import '../../src/screens/chapter_screens/chapter_screen.dart';
import '../../src/screens/detail_screens/manga_detail_screen.dart';
import '../../src/screens/home_screens/home_screen.dart';

MaterialPageRoute pageRoute(
    {RouteSettings routeSettings, Widget builder, bool isFullscreen = false}) {
  return MaterialPageRoute<dynamic>(
    builder: (BuildContext context) => builder,
    settings: routeSettings,
    fullscreenDialog: isFullscreen,
  );
}

Route generateRoute(RouteSettings routeSettings) {
  final args = routeSettings.arguments;
  switch (routeSettings.name) {
    case HomeScreen.routeName:
      return pageRoute(routeSettings: routeSettings, builder: HomeScreen());
    case MangaDetailScreen.routeName:
      return pageRoute(
          routeSettings: routeSettings,
          builder: MangaDetailScreen(endpoint: args.toString()));
    case ChapterScreen.routeName:
      var data = args as ChapterScreen;
      return pageRoute(
          routeSettings: routeSettings,
          builder: ChapterScreen(
            endpoint: data.endpoint,
            chapterList: data.chapterList,
          ));
    // case SearchScreen.routeName:
    //   return pageRoute(
    //       routeSettings: routeSettings,
    //       builder: SearchScreen());
    default:
      return MaterialPageRoute<dynamic>(
        builder: (_) => const Scaffold(
          body: Center(child: Text('No route defined for app')),
        ),
      );
  }
}
