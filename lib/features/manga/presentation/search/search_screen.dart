import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../shared/shared.dart';
import '../../manga.dart';

import '../home/widget/item_manga.dart';
import 'widget/show_list_genres.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  static const routeName = '/search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _controllerSearch;

  String query = '';
  bool _showDrawer = false;

  @override
  void initState() {
    _controllerSearch = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controllerSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final getWidth = ScreenHelper.getWidth(context);
    final getHeight = ScreenHelper.getSafeHeight(context);
    return BlocProvider(
      create: (_) => getIt<SearchScreenBloc>(),
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: theme.backgroundColor,
          title: BlocBuilder<SearchScreenBloc, SearchScreenState>(
            builder: (context, state) {
              return TextField(
                textInputAction: TextInputAction.search,
                autofocus: true,
                autocorrect: false,
                controller: _controllerSearch,
                decoration: InputDecoration(
                  hintText: 'Nhập tên truyện',
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
                  context.read<SearchScreenBloc>().add(
                        FetchDataSearchEvent(value),
                      );
                },
              );
            },
          ),
          leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Icon(
              Icons.arrow_back,
              color: theme.primaryColor,
            ),
            onPressed: () =>
                Navigator.of(context, rootNavigator: true).pop(false),
          ),
        ),
        body: Stack(
          children: [
            BlocBuilder<SearchScreenBloc, SearchScreenState>(
              builder: (context, state) {
                if (state is SearchScreenInitial) {
                  return Container(
                    color: theme.backgroundColor,
                    child: const Center(),
                  );
                }
                if (state is SearchScreenLoadingState) {
                  return const LoadingScreen();
                }
                if (state is SearchScreenLoadedState) {
                  return Container(
                    height: double.infinity,
                    color: theme.backgroundColor,
                    child: GridView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(12).copyWith(bottom: 70),
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
                          endpoint: manga.endpoint,
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
              duration: const Duration(milliseconds: 500),
              bottom: _showDrawer ? 0 : -getHeight + 50,
              left: 0,
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  color: theme.backgroundColor,
                  border: Border.all(
                    color: theme.primaryColor,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: getWidth,
                height: getHeight,
                child: DrawerSearchScreen(
                  isShowDrawer: _showDrawer,
                  searchAdvanced: (
                    String author,
                    String removeGenres,
                    String addGenres,
                  ) {
                    BlocProvider.of<SearchScreenBloc>(context).add(
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
          ],
        ),
      ),
    );
  }
}
