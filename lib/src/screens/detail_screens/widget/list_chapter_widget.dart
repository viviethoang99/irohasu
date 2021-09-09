import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/manga_detail_bloc/bloc.dart';
import '../../../helper/convert_date_time.dart';
import '../../chapter_screens/chapter_screen.dart';
import 'download_button_widget.dart';

class ListChapterWidget extends StatefulWidget {
  const ListChapterWidget({Key? key}) : super(key: key);

  @override
  _ListChapterWidgetState createState() => _ListChapterWidgetState();
}

class _ListChapterWidgetState extends State<ListChapterWidget> {
  bool _isReversed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BlocBuilder<MangaDetailBloc, MangaDetailState>(
                buildWhen: (pre, cur) => pre.runtimeType != cur.runtimeType,
                builder: (_, state) {
                  if (state is MangaDetailLoadedState) {
                    return Text(
                      '${state.data!.listChapter!.length} Chương',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              IconButton(
                icon: _isReversed
                    ? Icon(Icons.swap_vertical_circle,
                        color: Theme.of(context).buttonColor, size: 26)
                    : Icon(Icons.swap_vert,
                        color: Theme.of(context).primaryColor, size: 26),
                onPressed: () {
                  setState(() => _isReversed = !_isReversed);
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15).copyWith(top: 0),
          child: Divider(
            color: Theme.of(context).buttonColor,
            height: 5,
          ),
        ),
        MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: loadListChapter(),
        ),
      ],
    );
  }

  Widget loadListChapter() {
    return _ListChapterWidget(isReversed: _isReversed);
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
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocBuilder<MangaDetailBloc, MangaDetailState>(
          builder: (context, state) {
            if (state is MangaDetailLoadedState) {
              return ListView.separated(
                reverse: _isReversed,
                separatorBuilder: (_, index) => Divider(
                  color: theme.canvasColor,
                  height: 20,
                ),
                shrinkWrap: true,
                itemCount: state.data!.listChapter!.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  final chapter = state.data!.listChapter![index];
                  return ListTile(
                    contentPadding: const EdgeInsets.all(5),
                    dense: true,
                    title: Text(
                      chapter.title!.replaceFirst(state.data!.title, '').trim(),
                      style: chapter.isReading!
                          ? theme.textTheme.subtitle1!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )
                          : TextStyle(
                              color: theme.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                    ),
                    subtitle: Text(
                      ConvertDateTime.dateTimeToString(chapter.createAt!),
                      style: theme.textTheme.subtitle1!.copyWith(fontSize: 18),
                    ),
                    trailing: DownloadButtonWidget(item: chapter),
                    isThreeLine: true,
                    onTap: () {
                      Navigator.of(context).pushNamed(ChapterScreen.routeName,
                          arguments: ChapterScreen(endpoint: chapter.endpoint));
                    },
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }
}
