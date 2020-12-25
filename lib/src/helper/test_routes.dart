import 'package:flutter/material.dart';
import 'package:irohasu/src/ui/detail_screens/manga_detail_screen.dart';
import 'package:irohasu/src/ui/home_screens/recent_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RecentScreen.routeName:
      return MaterialPageRoute(builder: (context) => RecentScreen());
    case MangaDetailScreen.routeName:
      print(settings.arguments);
      return MaterialPageRoute(builder: (context) => MangaDetailScreen(endpoint: settings.arguments));
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for app')),
        ),
      );
  }}