import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../env.dart';
import '../../blocs/history_screen_bloc/history_screen_bloc.dart';
import '../../screens/home_screens/widget/appbar_widget.dart';
import 'detail_item_widget.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HistoryScreenBloc>().add(FetchDataHistory());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const AppBarHomeWidget(),
      body: BlocBuilder<HistoryScreenBloc, HistoryScreenState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              itemBuilder: (_, index) {
                final item = state.listManga[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      // HistoryData.addChapToHistory(
                      //   idManga: cacheData.data.idManga,
                      //   idChapter: lastChapter!.id,
                      // );
                      // BlocProvider.of<HistoryBloc>(context)
                      //     .add(FetchDataHistoryEvent());
                      // Navigator.of(context).pushNamed(
                      //   ChapterScreen.routeName,
                      //   arguments: ChapterScreen(
                      //     endpoint: lastChapter.endpoint,
                      //   ),
                      // );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      child: SizedBox(
                        height: 150.0,
                        child: Row(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                bottomLeft: Radius.circular(15.0),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: item.thumbnailUrl,
                                httpHeaders: ENV.headersBuilder,
                                fit: BoxFit.cover,
                                height: 150,
                                width: 100,
                              ),
                            ),
                            DetailItemWidget(
                              item: item.listChapter.first,
                              titleManga: item.title,
                              urlManga: item.endpoint,
                              idManga: item.idManga,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: state.listManga.length,
            ),
          );
        },
      ),
    );
  }
}
