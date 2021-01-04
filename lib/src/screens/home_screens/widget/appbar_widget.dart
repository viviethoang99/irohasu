import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      title: const Text(
        BlogTruyen.name,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.black87,
      elevation: 1.0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.search,
          size: 30,
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
            icon: const Icon(
              Icons.dashboard,
              size: 28,
            ),
            onPressed: () {}),
        PopupMenuButton<String>(
          icon: const Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 28,
          ),
          onSelected: choiceAction,
          itemBuilder: (BuildContext context){
            return PopupMenuHomeScreen.choices.map((String choice){
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

  void choiceAction(String choice){
    if(choice == PopupMenuHomeScreen.settings){
      print('Settings');
    }else if(choice == PopupMenuHomeScreen.subscribe){
      print('Subscribe');
    }else if(choice == PopupMenuHomeScreen.signOut){
      print('SignOut');
    }
  }
}
