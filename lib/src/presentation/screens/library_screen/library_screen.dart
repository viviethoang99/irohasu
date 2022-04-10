import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../blocs/library_screen_bloc/library_screen_bloc.dart';
import '../home_screens/widget/appbar_widget.dart';
import '../home_screens/widget/item_manga.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LibraryScreenBloc>()..add(WatchDataLibrary()),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const AppBarHomeWidget(),
        body: BlocBuilder<LibraryScreenBloc, LibraryScreenState>(
          builder: (_, state) {
            return Container(
              height: double.infinity,
              color: Theme.of(context).backgroundColor,
              child: GridView.builder(
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
                    endpoint: manga.endpoint,
                    imageCache: true,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
