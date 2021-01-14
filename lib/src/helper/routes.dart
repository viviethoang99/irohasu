import 'package:flutter/material.dart';
import 'package:irohasu/src/components/webview_widget.dart';

import '../../src/screens/chapter_screens/chapter_screen.dart';
import '../../src/screens/chapter_screens/setting_chapter.dart';
import '../../src/screens/detail_screens/manga_detail_screen.dart';
import '../../src/screens/index_screen/index_screen.dart';

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
    case IndexScreen.routeName:
      return pageRoute(routeSettings: routeSettings, builder: IndexScreen());
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
    case WebViewPage.routeName:
      var data = args as WebViewPage;
      return pageRoute(
        routeSettings: routeSettings,
        builder: WebViewPage(title: data.title, url: data.url)
      );
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
