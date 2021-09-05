import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/list_manga_library_bloc/list_manga_library_bloc.dart';
import '../../widgets/loading_screen.dart';
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
    BlocProvider.of<ListMangaLibraryBloc>(context).add(FetchDataLibrary());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBarHomeWidget(),
      body: BlocBuilder<ListMangaLibraryBloc, ListMangaLibraryState>(
        builder: (context, state) {
          if (state is ListMangaLibraryInitial) return Container();
          if (state is ListMangaLibraryLoading ||
              state is ListMangaLibraryFail) {
            return LoadingScreen();
          }
          if (state is ListMangaLibraryLoaded) {
            return Container(
              height: double.infinity,
              color: Theme.of(context).backgroundColor,
              child: GridView.builder(
                // reverse: true,
                shrinkWrap: true,
                padding: const EdgeInsets.all(12),
                itemCount: state.listCache.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.6,
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  final manga = state.listCache[index].data;
                  return ItemManga(
                    title: manga.title,
                    thumbnailUrl: manga.thumbnailUrl,
                    setUrlWithoutDomain: manga.endpoint,
                    status: 'library',
                  );
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
