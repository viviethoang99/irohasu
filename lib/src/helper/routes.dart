import 'package:flutter/material.dart';
import 'package:irohasu/src/screens/chapter_screens/setting_chapter.dart';

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
    case SettingChapter.routeName:
      return pageRoute(
          routeSettings: routeSettings,
          builder: SettingChapter());
    default:
      return MaterialPageRoute<dynamic>(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(child: Text('No route defined for app')),
        ),
      );
  }
}
