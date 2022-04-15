import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../env.dart';
import '../../../blocs/list_manga_bloc/list_manga_bloc.dart';
import '../../search_screen/search_screen.dart';

class AppBarHomeWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHomeWidget({Key? key}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      title: Text(
        ENV.nameApp,
        style: theme.textTheme.headline5,
      ),
      backgroundColor: theme.backgroundColor,
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
              context.read<ListMangaBloc>().add(RefreshMangaEvent());
            }),
      ],
    );
  }
}
