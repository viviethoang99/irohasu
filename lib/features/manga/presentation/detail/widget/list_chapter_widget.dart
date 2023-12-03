import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/item_not_found.dart';
import '../../../../../base/text.dart';
import '../../../../../config/config.dart';
import '../../../../../core/core.dart';
import '../../../../chapter/presentation/chapter_screens/chapter_screen.dart';
import '../../../manga.dart';

class ListChapterWidget extends StatefulWidget {
  const ListChapterWidget({super.key});

  @override
  State<ListChapterWidget> createState() => _ListChapterWidgetState();
}

class _ListChapterWidgetState extends State<ListChapterWidget> {
  bool _isReversed = false;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BlocSelector<MangaDetailBloc, MangaDetailState, ListChapter>(
                  selector: (state) => state.mangaDetail?.listChapter ?? [],
                  builder: (_, listChapter) {
                    if (listChapter.isNotEmpty) {
                      return IrohaText.semibold(
                        '${listChapter.length} Chương',
                        fontSize: FontSizes.s16,
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                IconButton(
                  icon: _isReversed
                      ? Icon(
                          Icons.swap_vertical_circle,
                          color: Theme.of(context).canvasColor,
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
              color: Theme.of(context).canvasColor,
              height: 5,
            ),
          ),
          BlocBuilder<MangaDetailBloc, MangaDetailState>(
            buildWhen: (previous, current) =>
                previous.mangaDetail?.listChapter !=
                current.mangaDetail?.listChapter,
            builder: (context, state) {
              if (state.mangaDetail?.listChapter.isNotEmpty ?? false) {
                return _ListChapterWidget(
                  isReversed: _isReversed,
                  listChapter: state.mangaDetail?.listChapter ?? [],
                  nameManga: state.mangaDetail?.title ?? '',
                );
              }

              return const ItemNotFound();
            },
          )
        ],
      ),
    );
  }
}

class _ListChapterWidget extends StatelessWidget {
  const _ListChapterWidget({
    required bool isReversed,
    this.listChapter = const [],
    this.nameManga = '',
  }) : _isReversed = isReversed;

  final bool _isReversed;
  final ListChapter listChapter;
  final String nameManga;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.separated(
          reverse: _isReversed,
          separatorBuilder: (_, index) => Divider(
            color: theme.canvasColor,
            height: 4,
          ),
          shrinkWrap: true,
          itemCount: listChapter.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            final chapter = listChapter[index];

            return _ChapterWidget(
              chapter: chapter,
              nameManga: nameManga,
            );
          },
        ),
      ),
    );
  }
}

class _ChapterWidget extends StatelessWidget {
  const _ChapterWidget({
    required this.chapter,
    this.nameManga = '',
  });

  final ChapterItem chapter;
  final String nameManga;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
      onTap: () => onTap(context),
      dense: true,
      title: IrohaText.bold(
        _title,
        fontSize: FontSizes.s16,
      ),
      subtitle: IrohaText.medium(
        chapter.createAt.dateToString(),
        fontSize: FontSizes.s12,
      ),
    );
  }

  void onTap(BuildContext context) {
    Navigator.of(context).pushNamed(
      ChapterScreen.routeName,
      arguments: ChapterScreen(
        data: context.read<MangaDetailBloc>().params(chapter.endpoint!),
      ),
    );
  }

  String get _title {
    return chapter.title?.replaceFirst(nameManga, '').trim().capitalize() ?? '';
  }
}
