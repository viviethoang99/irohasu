//
import 'package:flutter/material.dart';

//
import 'package:flutter_bloc/flutter_bloc.dart';

// Widget
import '../../blocs/list_manga_bloc/bloc.dart';
import '../../components/custom_bottom_nav_bar.dart';
import '../../constants/base_blogtruyen.dart';
import 'item_manga.dart';

class RecentScreen extends StatefulWidget {
  static const routeName = '/recent';

  @override
  _RecentScreenState createState() => _RecentScreenState();
}

class _RecentScreenState extends State<RecentScreen> {
  ListMangaBloc _listMangaBloc;

  // Scroll Controller
  ScrollController _scrollController;
  final _scrollThreshold = 400.0;

  @override
  void initState() {
    super.initState();
    _listMangaBloc = BlocProvider.of<ListMangaBloc>(context)
      ..add(FetchListMangaEvent());
    _scrollController = ScrollController()
      ..addListener(() {
        final maxScrollExtent = _scrollController.position.maxScrollExtent;
        final currentScroll = _scrollController.position.pixels;
        if (maxScrollExtent - currentScroll <= _scrollThreshold) {
          _listMangaBloc = BlocProvider.of<ListMangaBloc>(context)
            ..add(FetchListMangaEvent());
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Text(
                BlogTruyen.name,
                style: TextStyle(color: Colors.black87, fontSize: 22),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              centerTitle: true,
              actions: <Widget>[
                const IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black87,
                    ),
                    onPressed: null),
                const IconButton(
                    icon: Icon(
                      Icons.dashboard,
                      color: Colors.black87,
                    ),
                    onPressed: null),
                Stack(children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      child: ClipOval(
                        child: Image.asset('assets/images/Yuigahama.jpg'),
                      ),
                    ),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87,
                          blurRadius: 3,
                        )
                      ],
                    ),
                  ),
                ]),
              ],
            ),
            body: BlocBuilder<ListMangaBloc, ListMangaState>(
                builder: (context, state) {
              if (state is ListMangaLoadingState) {
                return Container(
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state is InitialListMangaState) {
                return const Center(child: Text('Hihi Dang loading'));
              }
              if (state is ListMangaLoadedState) {
                return Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: state.hasReachedEnd
                        ? state.data.length + 20
                        : state.data.length,
                    controller: _scrollController,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.7,
                      crossAxisCount: 3,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemBuilder: (context, index) {
                      return ItemManga(
                        title: state.data[index].title,
                        thumbnailUrl: state.data[index].thumbnailUrl,
                        setUrlWithoutDomain:
                            state.data[index].setUrlWithoutDomain,
                      );
                    },
                  ),
                );
              }
              return const Center(child: Text('Other states..'));
              //never run this line, only fix warning.
            }),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
