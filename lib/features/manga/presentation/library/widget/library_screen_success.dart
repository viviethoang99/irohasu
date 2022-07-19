part of '../library_screen.dart';

class _LibraryScreenSuccess extends StatelessWidget {
  const _LibraryScreenSuccess({
    Key? key,
    this.listManga = const [],
  }) : super(key: key);

  final ListMangaDetail listManga;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Theme.of(context).backgroundColor,
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(12),
        itemCount: listManga.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.6,
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemBuilder: (_, index) {
          final manga = listManga[index];
          return ItemManga(
            title: manga.title,
            thumbnailUrl: manga.thumbnailUrl,
            endpoint: manga.endpoint,
            imageCache: true,
          );
        },
      ),
    );
  }
}
