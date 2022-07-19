import 'package:flutter/material.dart';

import '../../features/chapter/presentation/chapter_screens/chapter_screen.dart';
import '../../features/manga/manga.dart';
import '../../features/shared/presentation/setting_screen/widget/general_page.dart';
import '../../features/shared/presentation/setting_screen/widget/info_screen.dart';
import '../../features/shared/presentation/setting_screen/widget/setting_chapter.dart';
import '../../features/shared/shared.dart';

class AppRoutes {
  static MaterialPageRoute _pageRoute({
    RouteSettings? routeSettings,
    Widget? builder,
    bool isFullscreen = false,
  }) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => builder!,
      settings: routeSettings,
      fullscreenDialog: isFullscreen,
    );
  }

  static Route generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case HomeScreen.routeName:
        return _pageRoute(
          routeSettings: routeSettings,
          builder: const HomeScreen(),
        );
      case GeneralSetting.routeName:
        return _pageRoute(
          routeSettings: routeSettings,
          builder: const GeneralSetting(),
        );
      case MangaDetailScreen.routeName:
        final data = args as MangaDetailScreen;

        return _pageRoute(
          routeSettings: routeSettings,
          builder: MangaDetailScreen(endpoint: data.endpoint),
        );
      case ChapterScreen.routeName:
        var data = args as ChapterScreen;
        return _pageRoute(
            routeSettings: routeSettings,
            builder: ChapterScreen(data: data.data));
      case SettingChapter.routeName:
        return _pageRoute(
          routeSettings: routeSettings,
          builder: const SettingChapter(),
        );
      // case WebViewPage.routeName:
      //   var data = args as WebViewPage;
      //   return pageRoute(
      //     routeSettings: routeSettings,
      //     builder: WebViewPage(title: data.title, url: data.url),
      //   );
      case SearchScreen.routeName:
        return _pageRoute(
            routeSettings: routeSettings, builder: const SearchScreen());
      case InfoScreen.routeName:
        return _pageRoute(
          routeSettings: routeSettings,
          builder: const InfoScreen(),
        );
      default:
        return _pageRoute(
          routeSettings: routeSettings,
          builder: const HomeScreen(),
        );
    }
  }
}
