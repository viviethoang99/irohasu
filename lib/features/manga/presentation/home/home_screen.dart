import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/text.dart';
import '../../../../config/config.dart';
import '../../../shared/shared.dart';
import '../../manga.dart';
import 'list_manga_widget.dart';

class ListMangaScreen extends StatefulWidget {
  const ListMangaScreen({super.key});

  static const routeName = '/home';

  @override
  State<ListMangaScreen> createState() => _ListMangaScreenState();
}

class _ListMangaScreenState extends State<ListMangaScreen> {
  @override
  void initState() {
    context.read<ListMangaBloc>().add(InitialFetchMangaEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<ListMangaBloc, ListMangaState>(
        builder: (context, state) {
          if (state.listManga.isNotEmpty) {
            return const ListMangaWidget();
          }

          if (state.listManga.isEmpty) {
            if (state.status == ListMangaScreenStatus.failure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.wifi_off,
                      size: 120,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Flexible(
                      child: IrohaText.semibold(
                        'Không thể kết nối mạng. \n'
                        'Vui lòng thử lại.',
                        fontSize: FontSizes.s24,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              );
            }
            return const LoadingScreen();
          }

          //never run this line, only fix warning.
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
