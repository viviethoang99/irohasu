import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../manga/manga.dart';
import '../../download.dart';

class DownloadButtonWidget extends StatelessWidget {
  const DownloadButtonWidget({
    super.key,
    required this.item,
  });

  final ChapterItem item;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DownloadMangaCubit, List<String>, bool>(
      selector: (state) => state.contains(item.id),
      builder: (context, state) {
        final color = context.watch<MangaDetailBloc>().state.colorManga;
        if (state) {
          return GestureDetector(
            onTap: () {
              context
                  .read<ManageDownloadBloc>()
                  .add(DeleteChapterEvent(item.endpoint!));
            },
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              child: const Icon(
                Icons.arrow_downward,
                size: 20,
                color: Colors.white,
              ),
            ),
          );
        }
        return GestureDetector(
          onTap: () {
            context
                .read<ManageDownloadBloc>()
                .add(AddChapterEvent(item.endpoint!));
          },
          child: _ItemDownload(
            color: color,
            process: 1,
          ),
        );
      },
    );
  }
}

class _ItemDownload extends StatelessWidget {
  const _ItemDownload({
    this.color = Colors.amber,
    this.process = 0.0,
  });

  final double process;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 25,
          width: 25,
          child: CircularProgressIndicator(
            value: process,
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
        Icon(
          Icons.arrow_downward,
          size: 20,
          color: color,
        ),
      ],
    );
  }
}
