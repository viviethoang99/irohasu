import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../env.dart';
import '../../blocs/history_bloc/history_bloc.dart';
import '../../components/loading_screen.dart';
import '../../helper/chap_helper.dart';
import '../../models/cache_manga_model.dart';
import '../../screens/chapter_screens/chapter_screen.dart';
import '../../screens/home_screens/widget/appbar_widget.dart';
import '../../service/history_data.dart';
import './detail_item_widget.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HistoryBloc>(context).add(FetchDataHistoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBarHomeWidget(),
      body: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
          if (state is HistoryInitial) return Container();
          if (state is HistoryLoading || state is HistoryFailed) {
            return LoadingScreen();
          }
          if (state is HistoryLoaded) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final CacheMangaModel cacheData = state.data![index];
                  final lastChapter = ChapHelper.getChapterLastReading(
                    cacheData.data.idManga,
                  );
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        HistoryData.addChapToHistory(
                          idManga: cacheData.data.idManga,
                          idChapter: lastChapter!.idChapter,
                        );
                        BlocProvider.of<HistoryBloc>(context)
                            .add(FetchDataHistoryEvent());
                        Navigator.of(context).pushNamed(
                          ChapterScreen.routeName,
                          arguments: ChapterScreen(
                            endpoint: lastChapter.chapterEndpoint,
                            chapterList: cacheData.data.listChapter,
                            titleManga: cacheData.data.title,
                            titleChapter: lastChapter.chapterTitle,
                            mangaDetail: cacheData.data.endpoint,
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
                        child: Container(
                          height: 150.0,
                          child: Row(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  bottomLeft: Radius.circular(15.0),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: cacheData.data.thumbnailUrl!,
                                  httpHeaders: ENV.headersBuilder,
                                  fit: BoxFit.cover,
                                  height: 150,
                                  width: 100,
                                ),
                              ),
                              DetailItemWidget(
                                item: lastChapter,
                                titleManga: cacheData.data.title,
                                urlManga: cacheData.data.endpoint,
                                idManga: cacheData.data.idManga,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: state.data!.length,
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
