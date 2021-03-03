import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../src/screens/home_screens/widget/appbar_widget.dart';
import '../../../src/screens/home_screens/widget/item_manga.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  var mangaBox = Hive.box<dynamic>('irohasu');

  List listLibrary;

  @override
  void initState() {
    super.initState();
    listLibrary = mangaBox.get('listManga', defaultValue: []).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBarHomeWidget(),
      body: ValueListenableBuilder(
          valueListenable: mangaBox.listenable(),
          builder: (context, Box _box, widget) {
            listLibrary.where((element) =>
                element.isFavorite == true || element.listDownload.length >= 0);
            return Container(
              height: double.infinity,
              color: Theme.of(context).backgroundColor,
              child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(12),
                itemCount: listLibrary.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.6,
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  final manga = listLibrary[index];
                  return ItemManga(
                    title: manga.title,
                    thumbnailUrl: manga.thumbnailUrl,
                    setUrlWithoutDomain: manga.endpoint,
                  );
                },
              ),
            );
          }),
    );
  }
}
