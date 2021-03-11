import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../helper/convert_date_time.dart';
import '../../../helper/media_query_helper.dart';
import '../chapter_screen.dart';

class CustomBottomDrawer extends StatefulWidget {
  CustomBottomDrawer({
    this.chapterList,
    this.idChapter,
    this.totalImage,
    this.scrollListController,
    this.currentIndex,
    this.onShowListManga,
  });

  final List chapterList;
  final int currentIndex;
  final int totalImage;
  final String idChapter;
  final ItemScrollController scrollListController;
  final Function(bool) onShowListManga;

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
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    subtitle: Text(
                      ConvertDateTime.dateTimeToString(chapter.chapterUpload),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontStyle: FontStyle.italic
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        ChapterScreen.routeName,
                        arguments: ChapterScreen(
                          endpoint: widget.chapterList[index].chapterEndpoint,
                          chapterList: widget.chapterList,
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StepProgressBar extends StatelessWidget {
  const StepProgressBar({Key key, this.currentStep, this.totalSteps})
      : super(key: key);

  final int currentStep;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width * 0.7;
    // if you are wrapping this widget in some padding
    const leftPadding = 10.0;
    const rightPadding = 10.0;

    // width of the separate widget
    const separatedWidth = 0.5;

    return Padding(
      padding: const EdgeInsets.only(
          top: 10, left: leftPadding, right: rightPadding, bottom: 10),
      child: Container(
        constraints: BoxConstraints(maxHeight: 10, maxWidth: screenWidth),
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: totalSteps,
          itemBuilder: (context, position) {
            return Container(
              width: (screenWidth -
                      ((totalSteps - 1) * separatedWidth) -
                      (leftPadding + rightPadding)) /
                  totalSteps,
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              child: Container(
                height: 5,
                decoration: BoxDecoration(
                  color: currentStep >= position
                      ? Colors.white
                      : Colors.transparent,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
