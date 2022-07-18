import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../../blocs/manga_detail_bloc/manga_detail_bloc.dart';
import '../../chapter_screens/chapter_screen.dart';

class ListChapterWidget extends StatefulWidget {
  const ListChapterWidget({Key? key, required this.color}) : super(key: key);
  final Color color;

  @override
  State<ListChapterWidget> createState() => _ListChapterWidgetState();
}

class _ListChapterWidgetState extends State<ListChapterWidget> {
  bool _isReversed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BlocBuilder<MangaDetailBloc, MangaDetailState>(
                  buildWhen: (pre, cur) => pre.runtimeType != cur.runtimeType,
                  builder: (_, state) {
                    if (state is MangaDetailSuccessState) {
                      return Text(
                        '${state.mangaDetail.listChapter.length} Chương',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 17,
                          letterSpacing: 1.6,
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                IconButton(
                  icon: _isReversed
                      ? Icon(
                          Icons.swap_vertical_circle,
                          color: widget.color,
                        )
                      : Icon(
                          Icons.swap_vert,
                          color: Theme.of(context).primaryColor,
                        ),
                  onPressed: () {
                    setState(() => _isReversed = !_isReversed);
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              color: widget.color,
              height: 5,
            ),
          ),
          _ListChapterWidget(isReversed: _isReversed),
        ],
      ),
    );
  }
}

class _ListChapterWidget extends StatelessWidget {
  const _ListChapterWidget({
    Key? key,
    required bool isReversed,
  })  : _isReversed = isReversed,
        super(key: key);

  final bool _isReversed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: BlocBuilder<MangaDetailBloc, MangaDetailState>(
            builder: (context, state) {
              if (state is MangaDetailSuccessState) {
                return ListView.separated(
                  reverse: _isReversed,
                  separatorBuilder: (_, index) => Divider(
                    color: theme.canvasColor,
                    height: 4,
                  ),
                  shrinkWrap: true,
                  itemCount: state.mangaDetail.listChapter.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    final chapter = state.mangaDetail.listChapter[index];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                      dense: true,
                      title: Text(
                        chapter.title!
                            .replaceFirst(state.mangaDetail.title, '')
                            .trim()
                            .capitalize(),
                        style: chapter.isReading
                            ? theme.textTheme.subtitle1!.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )
                            : TextStyle(
                                color: theme.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                      ),
                      subtitle: Text(
                        chapter.createAt.dateToString(),
                        style:
                            theme.textTheme.subtitle1?.copyWith(fontSize: 12),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          ChapterScreen.routeName,
                          arguments: ChapterScreen(
                            data: context
                                .read<MangaDetailBloc>()
                                .params(chapter.endpoint!),
                          ),
                        );
                      },
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          )),
    );
  }
}
