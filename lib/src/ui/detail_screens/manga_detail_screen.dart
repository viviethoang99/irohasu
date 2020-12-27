//
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//
import '../../../src/components/custom_button_reading_widget.dart';
import '../../../src/ui/chapter_screens/chapter_screen.dart';

//
import '../../blocs/manga_detail_bloc/bloc.dart';
import 'header_manga_detail.dart';

class MangaDetailScreen extends StatefulWidget {
  const MangaDetailScreen({Key key, this.endpoint}) : super(key: key);
  static const routeName = '/mangaDetail';
  final String endpoint;

  @override
  _MangaDetailScreenState createState() => _MangaDetailScreenState();
}

class _MangaDetailScreenState extends State<MangaDetailScreen> {
  MangaDetailBloc _mangaDetailBloc;

  String get endpoint => widget.endpoint;

  @override
  void initState() {
    super.initState();
    _mangaDetailBloc = BlocProvider.of<MangaDetailBloc>(context)
      ..add(FetchMangaDetailEvent(endpoint));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MangaDetailBloc, MangaDetailState>(
      builder: (context, state) {
        if (state is MangaDetailLoadingState) {
          return Container(
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is InitialMangaDetailState) {
          return const Center();
        }
        if (state is MangaDetailLoadedState) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.black87,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              actions: <Widget>[
                const IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: null,
                ),
                const IconButton(
                  icon: Icon(
                    Icons.get_app,
                    color: Colors.white,
                  ),
                  onPressed: null,
                ),
                const IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  onPressed: null,
                ),
              ],
            ),
            body: MediaQuery.removePadding(
              removeTop: true,
              removeBottom: true,
              context: context,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  HeaderMangaDetail(
                    title: state.data.title,
                    author: state.data.author,
                    status: state.data.status,
                    thumbnailUrl: state.data.thumb,
                    like: state.data.like,
                    dislike: state.data.dislike,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      children: <Widget>[
                        const IconButton(
                          icon: Icon(
                            Icons.cloud,
                            color: Colors.green,
                            size: 38,
                          ),
                          onPressed: null,
                        ),
                        const IconButton(
                          icon: Icon(
                            Icons.language,
                            color: Colors.green,
                            size: 38,
                          ),
                          onPressed: null,
                        ),
                        const IconButton(
                          icon: Icon(
                            Icons.share,
                            color: Colors.green,
                            size: 38,
                          ),
                          onPressed: null,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CustomButtonReadingWidget(
                            status: 'Bắt đầu đọc truyện', color: Colors.green),
                        CustomButtonReadingWidget(
                            status: 'Đọc bình luận', color: Colors.amber),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 27, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${state.data.chapter.length} Chapters',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const Icon(
                          Icons.text_rotate_vertical,
                          color: Colors.green,
                          size: 26,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(color: Colors.amber),
                  ),
                  MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: ListView.builder(
                        itemCount: state.data.chapter.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          return ListTile(
                            title: Text(
                              state.data.chapter[index].chapterTitle.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              state.data.chapter[index].chapterUpload
                                  .toString(),
                              style: const TextStyle(
                                color: Colors.white54,
                                fontSize: 18,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.arrow_circle_down,
                              color: Colors.green,
                              size: 30,
                            ),
                            isThreeLine: true,
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                ChapterScreen.routeName,
                                arguments: ChapterScreen(
                                  endpoint: state
                                      .data.chapter[index].chapterEndpoint
                                      .toString(),
                                  chapterList: state.data.chapter,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: const Text('Hello World'),
            centerTitle: true,
          ),
          body: Container(
            child: const Center(
              child: Text('Lỗi rồi bạn ei'),
            ),
          ),
        );
      },
    );
  }
}
