import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/library_screen_bloc/library_screen_bloc.dart';
import '../home_screens/widget/appbar_widget.dart';
import '../home_screens/widget/item_manga.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LibraryScreenBloc>().add(FetchDataLibrary());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBarHomeWidget(),
      body: BlocBuilder<LibraryScreenBloc, LibraryScreenState>(
        builder: (context, state) {
          return Container(
            height: double.infinity,
            color: Theme.of(context).backgroundColor,
            child: GridView.builder(
              // reverse: true,
              shrinkWrap: true,
              padding: const EdgeInsets.all(12),
              itemCount: state.listManga.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.6,
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemBuilder: (context, index) {
                final manga = state.listManga[index];
                return ItemManga(
                  title: manga.title,
                  thumbnailUrl: manga.thumbnailUrl,
                  setUrlWithoutDomain: manga.endpoint,
                  status: 'library',
                );
              },
            ),
          );
        },
      ),
    );
  }
}
