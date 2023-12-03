import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/item_not_found.dart';
import '../../../../../base/text.dart';
import '../../../../../config/config.dart';
import '../../../manga.dart';

class CustomChips extends StatelessWidget {
  const CustomChips({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocSelector<MangaDetailBloc, MangaDetailState, ListGenres>(
        selector: (state) => state.mangaDetail?.listGenres ?? [],
        builder: (_, listGenres) {
          if (listGenres.isNotEmpty) {
            return Wrap(
              spacing: 5,
              runSpacing: 5,
              children: List.generate(
                listGenres.length,
                (index) => _GenresWidget(
                  genres: listGenres[index],
                ),
              ),
            );
          }

          return const ItemNotFound();
        },
      ),
    );
  }
}

class _GenresWidget extends StatelessWidget {
  const _GenresWidget({required this.genres});

  final Genres genres;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 7,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IrohaText.regular(
        genres.name ?? '',
        fontSize: FontSizes.s11,
      ),
    );
  }
}
