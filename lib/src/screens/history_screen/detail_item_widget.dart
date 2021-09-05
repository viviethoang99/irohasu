import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/history_bloc/history_bloc.dart';
import '../../helper/chap_helper.dart';
import '../../helper/convert_date_time.dart';
import '../../models/chapter_item_model.dart';
import '../../screens/detail_screens/manga_detail_screen.dart';
import '../../service/history_data.dart';

class DetailItemWidget extends StatelessWidget {
  const DetailItemWidget({
    Key? key,
    required this.item,
    required this.titleManga,
    required this.urlManga,
    required this.idManga,
  }) : super(key: key);

  final ChapterItem? item;
  final String? titleManga;
  final String? urlManga;
  final String? idManga;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /*
                  1, Title Chapter;
                  2, Title Manga
                  3, Last reading
               */
              Text(
                ChapHelper.removeNameManga(
                  titleChapter: item!.chapterTitle!,
                  nameManga: titleManga,
                ),
                style: TextStyle(
                  fontSize: 23,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(height: 4),
              Text(
                titleManga!,
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(height: 4),
              Text(
                ConvertDateTime.checkLastRead(
                  item!.timeReading ?? DateTime.now(),
                ),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        MangaDetailScreen.routeName,
                        arguments: urlManga,
                      );
                    },
                    child: const Text(
                      'Xem chi tiết',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () => _removeHistory(
                            context,
                            idManga: idManga,
                            idChapter: item!.idChapter,
                          ),
                      child: const Text(
                        'Xoá',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _removeHistory(
    BuildContext context, {
    required String? idChapter,
    required String? idManga,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          var _value = false;
          return StatefulBuilder(builder: (context, setState) {
            final theme = Theme.of(context);
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.only(
                top: 20,
                left: 25,
                right: 25,
              ),
              title: Text(
                'Xóa dữ liệu',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: theme.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              content: Container(
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Xóa lịch sử đọc chương này?',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.start,
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Xóa tất cả.',
                        style: TextStyle(
                          color: _value ? theme.buttonColor : Colors.red,
                          fontSize: 20,
                        ),
                      ),
                      value: _value,
                      onChanged: (newValue) {
                        setState(() {
                          _value = !_value;
                        });
                      },
                      activeColor: theme.buttonColor,
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ],
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () =>
                          Navigator.of(context, rootNavigator: true).pop(false),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'KHÔNG',
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        var statusRemove = await HistoryData.removeHistory(
                            idChapter: _value ? 'all' : idChapter,
                            idManga: idManga);
                        if (statusRemove) {
                          BlocProvider.of<HistoryBloc>(context)
                              .add(FetchDataHistoryEvent());
                        }
                        Navigator.of(context, rootNavigator: true).pop(true);
                      },
                      child: Text(
                        'ĐÚNG',
                        style: TextStyle(
                          color: theme.buttonColor,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            );
          });
        });
  }
}
