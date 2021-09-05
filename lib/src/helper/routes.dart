import 'package:flutter/material.dart';

import '../components/webview_widget.dart';
import '../screens/chapter_screens/chapter_screen.dart';
import '../screens/detail_screens/manga_detail_screen.dart';
import '../screens/index_screen/index_screen.dart';
import '../screens/search_screens/search_screen.dart';
import '../screens/setting_screen/widget/general_page.dart';
import '../screens/setting_screen/widget/setting_chapter.dart';

MaterialPageRoute pageRoute({
  RouteSettings? routeSettings,
  Widget? builder,
  bool isFullscreen = false,
}) {
  return MaterialPageRoute<dynamic>(
    builder: (BuildContext context) => builder!,
    settings: routeSettings,
    fullscreenDialog: isFullscreen,
  );
}

Route generateRoute(RouteSettings routeSettings) {
  final args = routeSettings.arguments;
  switch (routeSettings.name) {
    case IndexScreen.routeName:
      return pageRoute(
        routeSettings: routeSettings,
        builder: IndexScreen(),
      );
    case GeneralSetting.routeName:
      return pageRoute(
        routeSettings: routeSettings,
        builder: GeneralSetting(),
      );
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
            titleChapter: data.titleChapter,
            titleManga: data.titleManga,
            mangaDetail: data.mangaDetail,
          ));
    case SettingChapter.routeName:
      return pageRoute(
        routeSettings: routeSettings,
        builder: SettingChapter(),
      );
    case WebViewPage.routeName:
      var data = args as WebViewPage;
      return pageRoute(
        routeSettings: routeSettings,
        builder: WebViewPage(title: data.title, url: data.url),
      );
    case SearchScreen.routeName:
      return pageRoute(routeSettings: routeSettings, builder: SearchScreen());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(child: Text('No route defined for app')),
        ),
      );
  }
}
