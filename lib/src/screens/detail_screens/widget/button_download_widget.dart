import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/download_bloc/download_bloc.dart';
import '../../../models/chapter_item_model.dart';
import '../../../models/manga_detail_model.dart';

@immutable
class DownloadButton extends StatefulWidget {
  const DownloadButton({
    Key key,
    this.transitionDuration = const Duration(milliseconds: 500),
    this.item,
    this.data,
  }) : super(key: key);

  final Duration transitionDuration;
  final ChapterItem item;
  final MangaDetailModel data;

  @override
  _DownloadButtonState createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DownloadBloc(),
      child: BlocBuilder<DownloadBloc, DownloadState>(
        builder: (BuildContext context, state) {
          if (state is DownloadedState || widget.item.isDownload != null) {
            return const IconButton(
                icon: Icon(
                  Icons.ac_unit_rounded,
                  size: 30,
                  color: Colors.red,
                ),
                onPressed: null);
          }
          if (state is DownloadingState || state is DownloadProcessState) {
            return _buildDownloadingProgress(state);
          }
          if (state is DownloadInitialState && widget.item.isDownload == null) {
            return IconButton(
                icon: Icon(
                  Icons.arrow_circle_down,
                  size: 30,
                  color: Theme.of(context).buttonColor,
                ),
                onPressed: () async {
                  BlocProvider.of<DownloadBloc>(context).add(
                      DownloadChapterEvent(
                          chapterModel: widget.item,
                          titleManga: widget.data.title,
                          idManga: widget.data.idManga));
                });
          }
          if (state is DownloadProcessState) {
            // print('Download is ${state.downloadPercentageCompleted * 100}%');
            return Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                height: 20,
                width: 20,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      BlocProvider.of<DownloadBloc>(context).add(
                          CancelDownloadEvent(
                              idChapter: widget.item.idChapter));
                    },
                    child: CircularProgressIndicator(
                      value: state.downloadPercentageCompleted,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).buttonColor),
                    ),
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildDownloadingProgress(DownloadState state) {
    return Positioned.fill(
      child: AnimatedOpacity(
        duration: widget.transitionDuration,
        opacity: (state is DownloadProcessState) || (state is DownloadingState)
            ? 1.0
            : 0.0,
        curve: Curves.ease,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildProgressIndicator(state),
            if (state is DownloadProcessState)
              const Icon(
                Icons.stop,
                size: 14,
                color: Colors.red,
              )
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator(DownloadState state) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1),
          duration: const Duration(milliseconds: 200),
          builder: (BuildContext context, double progress, Widget child) {
            return CircularProgressIndicator(
              backgroundColor: Colors.white.withOpacity(0.0),
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).buttonColor,
              ),
              strokeWidth: 2.0,
              value: (state is DownloadProcessState) ? progress : null,
            );
          }),
    );
  }
}