import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irohasu/src/components/webview_widget.dart';

import '../../../blocs/search_bloc/bloc.dart';
import '../../../constants/base_blogtruyen.dart';
import '../../search_screens/button_search_widget.dart';
import './popup_menu_button.dart';

class AppBarHomeWidget extends StatefulWidget implements PreferredSizeWidget {
  AppBarHomeWidget({Key key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  _AppBarHomeWidgetState createState() => _AppBarHomeWidgetState();
}

class _AppBarHomeWidgetState extends State<AppBarHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        BlogTruyen.name,
        style: Theme.of(context).textTheme.headline5,
      ),
      backgroundColor: Theme.of(context).accentColor,
      elevation: 1.0,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.search,
          size: 30,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () async {
          var manga = await showSearch(
              context: context,
              delegate: SearchScreen(
                bloc: BlocProvider.of<SearchBloc>(context),
              ));
        },
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.dashboard,
              size: 28,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {}),
        PopupMenuButton<String>(
          icon: Icon(
            Icons.more_vert,
            size: 28,
            color: Theme.of(context).primaryColor,
          ),
          onSelected: choiceAction,
          itemBuilder: (BuildContext context) {
            return PopupMenuHomeScreen.choices.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        )
      ],
    );
  }

  void choiceAction(String choice) {
    if (choice == PopupMenuHomeScreen.openWebView) {
      Navigator.of(context).pushNamed(WebViewPage.routeName,
          arguments: const WebViewPage(title: 'BlogTruyen', url: ''));
    } else if (choice == PopupMenuHomeScreen.settings) {
      print('Cài đặt');
    }
  }
}
