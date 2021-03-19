import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../helper/convert_date_time.dart';
import '../../../helper/media_query_helper.dart';
import './step_progress_bar.dart';

class CustomBottomDrawer extends StatefulWidget {
  CustomBottomDrawer({
    this.chapterList,
    this.idChapter,
    this.totalImage,
    this.scrollListController,
    this.currentIndex,
    this.onShowListManga,
    this.idManga,
    this.openChapter,
  });

  final List chapterList;
  final int currentIndex;
  final int totalImage;
  final String idChapter;
  final String idManga;
  final ItemScrollController scrollListController;
  final Function(bool) onShowListManga;
  final Function openChapter;

  @override
  _CustomBottomDrawerState createState() => _CustomBottomDrawerState();
}

class _CustomBottomDrawerState extends State<CustomBottomDrawer> {
  int getIndex;

  @override
  void initState() {
    super.initState();
    getIndex = widget.chapterList.indexWhere(
      (chapter) => chapter.idChapter == widget.idChapter,
    );
  }

  @override
  void didUpdateWidget(covariant CustomBottomDrawer oldWidget) {
    getIndex = widget.chapterList.indexWhere(
      (chapter) => chapter.idChapter == widget.idChapter,
    );
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    var heightScreen = ScreenHelper.getHeight(context);
    var widthScreen = ScreenHelper.getWidth(context);
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Container(
        color: Colors.black87,
        width: widthScreen,
        height: heightScreen * 0.5 + 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: IconButton(
                      icon: const Icon(
                        Icons.format_list_numbered,
                        color: Colors.white70,
                        size: 33,
                      ),
                      onPressed: () => widget.onShowListManga(true)),
                  // onPressed: () {}),
                ),
                Expanded(
                  child: StepProgressBar(
                    currentStep: widget.currentIndex,
                    totalSteps: widget.totalImage,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(
                    '${widget.currentIndex + 1} / ${widget.totalImage}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Divider(
              height: 2.0,
              color: Colors.green,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 5,
                bottom: 90,
              ),
              width: double.infinity,
              height: heightScreen * 0.5,
              child: ScrollablePositionedList.builder(
                itemCount: widget.chapterList.length,
                itemScrollController: widget.scrollListController,
                itemBuilder: (context, index) {
                  final chapter = widget.chapterList[index];
                  return ListTile(
                    selected: (index == getIndex),
                    selectedTileColor: Colors.green,
                    title: Text(
                      chapter.chapterTitle.trim(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      ConvertDateTime.dateTimeToString(chapter.chapterUpload),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onTap: () => widget.openChapter(index),
                  );
                },
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
          ],
        ),
      ),
    );
  }
}
