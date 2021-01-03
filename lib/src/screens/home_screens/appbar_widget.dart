import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../src/blocs/search_bloc/bloc.dart';
import '../../../src/constants/base_blogtruyen.dart';
import '../../../src/screens/search_screens/button_search_widget.dart';

class AppBarHomeWidget extends StatefulWidget implements PreferredSizeWidget {
  AppBarHomeWidget({Key key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  _AppBarHomeWidgetState createState() => _AppBarHomeWidgetState();
}

class _AppBarHomeWidgetState extends State<AppBarHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        BlogTruyen.name,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.black87,
      elevation: 1.0,
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.search,
            size: 30,
          ),
          onPressed: () async {
            var manga = await showSearch(
                context: context,
                delegate:
                    SearchScreen(bloc: BlocProvider.of<SearchBloc>(context)));
          },
        ),
        IconButton(
            icon: const Icon(
              Icons.dashboard,
              size: 28,
            ),
            onPressed: () {}),
        const IconButton(
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 28,
          ),
          onPressed: null,
        ),
      ],
    );
  }
}
