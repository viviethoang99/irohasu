import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irohasu/src/blocs/list_manga_bloc/bloc.dart';

import '../../../../env.dart';
import '../../../blocs/search_bloc/bloc.dart';
import '../../search_screens/button_search_widget.dart';

class AppBarHomeWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      title: Text(
        ENV.nameApp,
        style: theme.textTheme.headline5,
      ),
      backgroundColor: theme.accentColor,
      elevation: 1.0,
      centerTitle: true,
      leading: Container(
        margin: const EdgeInsets.only(left: 8),
        child: IconButton(
          icon: Icon(
            Icons.search,
            size: 34,
            color: theme.primaryColor,
          ),
          onPressed: () async {
            var manga = await showSearch(
                context: context,
                delegate: SearchScreen(
                  bloc: BlocProvider.of<SearchBloc>(context),
                ));
          },
        ),
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.autorenew_outlined,
              size: 32,
              color: theme.primaryColor,
            ),
            onPressed: () {
              BlocProvider.of<ListMangaBloc>(context)
                  .add(FetchListMangaEvent());
            }),
        Container(
          margin: const EdgeInsets.only(right: 8),
          child: IconButton(
              icon: Icon(
                Icons.dashboard,
                size: 30,
                color: theme.primaryColor,
              ),
              onPressed: () {}),
        ),
        // PopupMenuButton<String>(
        //   icon: Icon(
        //     Icons.more_vert,
        //     size: 28,
        //     color: Theme.of(context).primaryColor,
        //   ),
        //   onSelected: (context) => choiceAction,
        //   itemBuilder: (BuildContext context) {
        //     return PopupMenuHomeScreen.choices.map((String choice) {
        //       return PopupMenuItem<String>(
        //         value: choice,
        //         child: Text(choice),
        //       );
        //     }).toList();
        //   },
        // )
      ],
    );
  }

// void choiceAction(String choice, BuildContext context) {
//   if (choice == PopupMenuHomeScreen.openWebView) {
//     Navigator.of(context).pushNamed(WebViewPage.routeName,
//         arguments: const WebViewPage(title: 'BlogTruyen', url: ''));
//   } else if (choice == PopupMenuHomeScreen.settings) {
//     print('Cài đặt');
//   }
// }
}
