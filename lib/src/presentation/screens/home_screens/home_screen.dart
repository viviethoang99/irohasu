import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/list_manga_bloc/list_manga_bloc.dart';
import '../../widgets/loading_screen.dart';
import 'list_manga_widget.dart';
import 'widget/appbar_widget.dart';

class ListMangaScreen extends StatefulWidget {
  const ListMangaScreen({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  State<ListMangaScreen> createState() => _ListMangaScreenState();
}

class _ListMangaScreenState extends State<ListMangaScreen> {
  late final ScrollController? _scrollController;
  final _scrollThreshold = 300.0;

  @override
  void initState() {
    super.initState();
    context.read<ListMangaBloc>().add(InitialFetchMangaEvent());
    _scrollController = ScrollController()
      ..addListener(() {
        final maxScrollExtent = _scrollController!.position.maxScrollExtent;
        final currentScroll = _scrollController!.position.pixels;
        if (maxScrollExtent - currentScroll <= _scrollThreshold) {
          context.read<ListMangaBloc>().add(FetchListMangaEvent());
        }
      });
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: const AppBarHomeWidget(),
            body: BlocBuilder<ListMangaBloc, ListMangaState>(
                builder: (context, state) {
              if (state.listManga.isNotEmpty) {
                return ListMangaWidget(
                  scrollController: _scrollController,
                  data: state.listManga,
                  hasReachedEnd: state.hasReachedMax,
                );
              }
              if (state.listManga.isEmpty) return const LoadingScreen();

              if (state.listManga.isEmpty &&
                  state.status == ListMangaScreenStatus.failure) {
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
                        child: Text(
                          'Không thể kết nối mạng. \n'
                          'Vui lòng thử lại.',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                );
              }

              //never run this line, only fix warning.
              return const SizedBox.shrink();
            }),
          ),
        ],
      ),
    );
  }
}
