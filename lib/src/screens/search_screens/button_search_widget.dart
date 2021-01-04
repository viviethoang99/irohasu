import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../src/blocs/search_bloc/bloc.dart';
import '../../../src/constants/base_content.dart';
import '../../../src/models/search_model.dart';
import '../home_screens/widget/item_manga.dart';

class SearchScreen extends SearchDelegate<SearchModel> {
  SearchScreen({this.bloc});

  final Bloc<SearchEvent, SearchState> bloc;

  @override
  String get searchFieldLabel => Content.search;

  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          query = '';
        },
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
    bloc.add(FetchDataSearchEvent(query: query));
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      if (state is InitialSearchState) {
        return Container(
          child: const Center(),
        );
      }
      if (state is SearchLoadingState) {
        return Container(
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      if (state is SearchLoadedState) {
        return Container(
          height: double.infinity,
          decoration: const BoxDecoration(color: Colors.black87),
          child: GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(12),
            itemCount: state.list.length,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.6,
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              return ItemManga(
              title: state.list[index].title,
              thumbnailUrl: state.list[index].thumbnailUrl,
              setUrlWithoutDomain: state.list[index].setUrlWithoutDomain,
              );
            },
          ),
        );
      }
      return const Center(child: Text('Other states..'));
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) => Container();
}
