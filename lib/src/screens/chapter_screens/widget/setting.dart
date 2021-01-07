import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../chapter_screen.dart';

class Setting extends StatefulWidget {
  Setting(
      {this.indexChapter,
        this.indexPage,
        this.listChapter,
        this.height,
        this.totalImage,
        this.scrollListController});

  final int indexChapter;
  final int indexPage;
  final List listChapter;
  final double height;
  final int totalImage;
  final ItemScrollController scrollListController;

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  int get _getIndexChapter => widget.indexChapter;

  int get _getIndexPage => widget.indexPage;

  int get _totalImage => widget.totalImage;

  double get _getHeight => widget.height;

  List get _getChapterList => widget.listChapter;

  ItemScrollController get _scrollListController => widget.scrollListController;

  @override
  Widget build(BuildContext context) {
    return _buildBottomDrawer(context);
  }

  Widget _buildBottomDrawer(BuildContext context) {
    return BottomDrawer(
      cornerRadius: 26,
      header: _buildBottomDrawerHead(context),
      body: _buildBottomDrawerBody(context),
      headerHeight: _headerHeight,
      drawerHeight: _getHeight * 0.5,
      color: Colors.black87,
      controller: _controllerBottom,
    );
  }

  Widget _buildBottomDrawerHead(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: _headerHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const IconButton(
                icon: Icon(
                  Icons.format_list_numbered,
                  color: Colors.white70,
                  size: 33,
                ),
                onPressed: null,
              ),
              Expanded(
                child: StepProgressBar(
                  currentStep: _getIndexPage,
                  totalSteps: _totalImage,
                ),
              ),
              Text(
                '${_getIndexPage + 1} / $_totalImage ',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Spacer(),
          const Divider(
            height: 2.0,
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomDrawerBody(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollListController.jumpTo(
          index: _getIndexChapter, alignment: 0.5);
    });
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      height: _getHeight * 0.5,
      child: ScrollablePositionedList.builder(
        itemCount: _getChapterList.length,
        itemScrollController: _scrollListController,
        itemBuilder: (context, index) {
          return ListTile(
            selected: (index == _getIndexChapter),
            selectedTileColor: Colors.green,
            title: Text(
              _getChapterList[index].chapterTitle.toString(),
              style: const TextStyle(fontSize: 17, color: Colors.white),
            ),
            subtitle: Text(
              _getChapterList[index].chapterUpload.toString(),
              style: const TextStyle(fontSize: 17, color: Colors.white),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(
                ChapterScreen.routeName,
                arguments: ChapterScreen(
                  endpoint: _getChapterList[index].chapterEndpoint.toString(),
                  chapterList: _getChapterList,
                ),
              );
            },
          );
        },
      ),
    );
  }

  final double _headerHeight = 65;
  final BottomDrawerController _controllerBottom = BottomDrawerController();
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
