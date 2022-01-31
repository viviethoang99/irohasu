import 'package:flutter/material.dart';
import '../../presentation/screens/chapter_screens/chapter_screen.dart';
import '../../presentation/screens/detail_screens/manga_detail_screen.dart';
import '../../presentation/screens/index_screen/index_screen.dart';
import '../../presentation/screens/search_screens/search_screen.dart';
import '../../presentation/screens/setting_screen/widget/general_page.dart';
import '../../presentation/screens/setting_screen/widget/setting_chapter.dart';

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
      case IndexScreen.routeName:
        return _pageRoute(
          routeSettings: routeSettings,
          builder: IndexScreen(),
        );
      case GeneralSetting.routeName:
        return _pageRoute(
          routeSettings: routeSettings,
          builder: GeneralSetting(),
        );
      case MangaDetailScreen.routeName:
        return _pageRoute(
            routeSettings: routeSettings,
            builder: MangaDetailScreen(endpoint: args.toString()));
      case ChapterScreen.routeName:
        var data = args as ChapterScreen;
        return _pageRoute(
            routeSettings: routeSettings,
            builder: ChapterScreen(endpoint: data.endpoint));
      case SettingChapter.routeName:
        return _pageRoute(
          routeSettings: routeSettings,
          builder: SettingChapter(),
        );
      // case WebViewPage.routeName:
      //   var data = args as WebViewPage;
      //   return pageRoute(
      //     routeSettings: routeSettings,
      //     builder: WebViewPage(title: data.title, url: data.url),
      //   );
      case SearchScreen.routeName:
        return _pageRoute(routeSettings: routeSettings, builder: SearchScreen());
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
}
