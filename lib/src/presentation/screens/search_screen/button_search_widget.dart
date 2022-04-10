import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/base_content.dart';
import '../../../domain/entities/manga_detail.dart';
import '../../blocs/search_screen/search_screen_bloc.dart';
import '../../widgets/loading_screen.dart';
import '../home_screens/widget/item_manga.dart';

class ButtonSearchWidget extends SearchDelegate<MangaDetail?> {
  ButtonSearchWidget();

  @override
  String get searchFieldLabel => ConstantStrings.search;

  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    context.read<SearchScreenBloc>().add(FetchDataSearchEvent(query: query));
    return BlocBuilder<SearchScreenBloc, SearchScreenState>(
        builder: (context, state) {
      if (state is SearchScreenInitial) {
        return const Center();
      }
      if (state is SearchScreenLoadingState) {
        return const LoadingScreen();
      }
      if (state is SearchScreenLoadedState) {
        return Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
          ),
          child: GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(12),
            itemCount: state.list.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.6,
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              final item = state.list[index];
              return ItemManga(
                title: item.title,
                thumbnailUrl: item.thumbnailUrl,
                endpoint: item.endpoint,
              );
            },
          ),
        );
      }
      return Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
        ),
        child: const Center(child: Text('Không thể load được dữ liệu...')),
      );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) => Container();
}
