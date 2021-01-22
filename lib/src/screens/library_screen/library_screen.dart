import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:irohasu/src/helper/hive/hive_manga_model.dart';
import 'package:irohasu/src/screens/home_screens/widget/appbar_widget.dart';
import 'package:irohasu/src/screens/home_screens/widget/item_manga.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  var mangaBox = Hive.box<HiveMangaModel>(HiveMangaModel.mangaBox);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBarHomeWidget(),
      body: ValueListenableBuilder(
          valueListenable: mangaBox.listenable(),
          builder: (context, Box<HiveMangaModel> _box, widget) {
            return Container(
              color: Theme.of(context).backgroundColor,
              child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(12),
                itemCount: _box.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.6,
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  final manga = _box.values.toList()[index];
                  return ItemManga(
                    title: manga.title,
                    thumbnailUrl: manga.thumb,
                    setUrlWithoutDomain: manga.mangaEndpoint,
                  );
                },
              ),
            );
          }),
    );
  }
}
