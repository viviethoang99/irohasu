import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../env.dart';
import '../../../blocs/list_manga_bloc/bloc.dart';
import '../../../screens/search_screens/search_screen.dart';

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
          onPressed: () =>
              Navigator.of(context).pushNamed(SearchScreen.routeName),
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
              BlocProvider.of<ListMangaBloc>(context)..add(RefreshMangaEvent());
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
      ],
    );
  }
}
