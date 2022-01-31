import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/helper/media_query_helper.dart';
import '../../blocs/search_bloc/bloc.dart';
import '../../screens/home_screens/widget/item_manga.dart';
import '../../screens/search_screens/show_list_genres.dart';
import '../../widgets/loading_screen.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controllerSearch = TextEditingController();
  String query = '';
  bool _showDrawer = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final getWidth = ScreenHelper.getWidth(context);
    final getHeight = ScreenHelper.getSafeHeight(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: TextField(
          textInputAction: TextInputAction.search,
          autofocus: true,
          autocorrect: false,
          controller: _controllerSearch,
          decoration: InputDecoration(
            hintText: 'Nhập tên truyện.',
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: _controllerSearch.clear,
              color: theme.primaryColor.withOpacity(0.5),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
          ),
          style: TextStyle(
            color: theme.primaryColor,
            fontSize: 20,
          ),
          onSubmitted: (value) {
            BlocProvider.of<SearchBloc>(context).add(FetchDataSearchEvent(
              query: value,
            ));
          },
        ),
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.of(context, rootNavigator: true).pop(false),
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is InitialSearchState) {
                  return Container(
                    child: const Center(),
                  );
                }
                if (state is SearchLoadingState) {
                  return LoadingScreen();
                }
                if (state is SearchLoadedState) {
                  return Container(
                    height: double.infinity,
                    color: Theme.of(context).backgroundColor,
                    child: GridView.builder(
                      // reverse: true,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(12),
                      itemCount: state.list.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.6,
                        crossAxisCount: 3,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                      ),
                      itemBuilder: (context, index) {
                        final manga = state.list[index];
                        return ItemManga(
                          title: manga.title,
                          thumbnailUrl: manga.thumbnailUrl,
                          setUrlWithoutDomain: manga.endpoint,
                        );
                      },
                    ),
                  );
                }
                return const Center(child: Text('Other states..'));
              },
            ),
            if (_showDrawer)
              AnimatedOpacity(
                opacity: 1.0,
                duration: const Duration(
                  milliseconds: 500,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 5.0, sigmaX: 5.0),
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            AnimatedPositioned(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 300),
              bottom: _showDrawer ? 0 : -getHeight + 70,
              left: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: getWidth,
                  height: getHeight,
                  color: _showDrawer
                      ? theme.backgroundColor
                      : theme.buttonColor.withOpacity(0.8),
                  child: DrawerSearchScreen(
                    isShowDrawer: _showDrawer,
                    searchAdvanced: (
                      String author,
                      String removeGenres,
                      String addGenres,
                    ) {
                      BlocProvider.of<SearchBloc>(context).add(
                        AdvancedSearchEvent(
                          query: _controllerSearch.text,
                          author: author,
                          removeGenres: removeGenres,
                          addGenres: addGenres,
                        ),
                      );
                    },
                    showDrawer: () {
                      setState(() {
                        _showDrawer = !_showDrawer;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
