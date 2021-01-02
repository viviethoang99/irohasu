import 'package:flutter/material.dart';
import 'package:irohasu/src/ui/search_screens/search_screen.dart';

import '../../src/ui/chapter_screens/chapter_screen.dart';
import '../../src/ui/detail_screens/manga_detail_screen.dart';
import '../../src/ui/home_screens/recent_screen.dart';

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
    case RecentScreen.routeName:
      return pageRoute(routeSettings: routeSettings, builder: RecentScreen());
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
