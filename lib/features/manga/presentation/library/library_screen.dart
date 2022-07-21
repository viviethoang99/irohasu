import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../manga.dart';
import '../home/widget/item_manga.dart';

part 'widget/library_screen_success.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listId = context.watch<ManageFavoriteMangaBloc>().state.listId;
    return BlocProvider(
      create: (_) => getIt<LibraryScreenBloc>()..add(WatchDataLibrary(listId)),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: const AppBarHomeWidget(),
        body: BlocBuilder<LibraryScreenBloc, LibraryScreenState>(
          builder: (context, state) {
            if (state is LibrarySuccessScreen) {
              return _LibraryScreenSuccess(
                listManga: state.listManga,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
