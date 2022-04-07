import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/chapter_item_model.dart';
import '../../../blocs/download_bloc/download_bloc.dart';

class DownloadButtonWidget extends StatelessWidget {
  const DownloadButtonWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ChapterItem item;
  final Duration transitionDuration = const Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DownloadBloc(),
      child: BlocBuilder<DownloadBloc, DownloadState>(
        builder: (_, state) {
          if (state is DownloadedState || item.isDownload != null) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 31,
                  width: 31,
                  child: RawMaterialButton(
                    onPressed: () {},
                    elevation: 2.0,
                    fillColor: Theme.of(context).buttonColor,
                    shape: const CircleBorder(),
                    child: Icon(
                      Icons.arrow_downward,
                      size: 25.0,
                      color: Theme.of(context).backgroundColor,
                    ),
                  )),
            );
          }
          if (state is DownloadingState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 29,
                width: 29,
                child: AnimatedOpacity(
                  duration: transitionDuration,
                  opacity: 0.0,
                  curve: Curves.ease,
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).buttonColor),
                    ),
                  ),
                ),
              ),
            );
          }
          if (state is DownloadInitialState && item.isDownload == null ||
              state is DownloadFailureState) {
            return IconButton(
              icon: Icon(
                Icons.arrow_circle_down,
                size: 37,
                color: Theme.of(context).buttonColor,
              ),
              onPressed: () => BlocProvider.of<DownloadBloc>(context).add(
                DownloadChapterEvent(
                  chapterModel: item,
                  titleManga: 'data!.title',
                  idManga: 'data!.idManga',
                ),
              ),
            );
          }
          if (state is DownloadProcessState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 29,
                width: 29,
                child: AnimatedOpacity(
                  duration: transitionDuration,
                  opacity: 1.0,
                  curve: Curves.ease,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        BlocProvider.of<DownloadBloc>(context)
                            .add(CancelDownloadEvent(idChapter: item.id!));
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            backgroundColor: Colors.white.withOpacity(0.0),
                            value: state.downloadPercentageCompleted,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).buttonColor),
                          ),
                          const Icon(
                            Icons.stop,
                            size: 18,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return IconButton(
            icon: Icon(
              Icons.arrow_circle_down,
              size: 37,
              color: Theme.of(context).buttonColor,
            ),
            onPressed: () => context.read<DownloadBloc>().add(
                  DownloadChapterEvent(
                    chapterModel: item,
                    titleManga: 'data!.title',
                    idManga: 'data!.idManga',
                  ),
                ),
          );
        },
      ),
    );
  }
}
