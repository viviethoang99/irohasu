import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/text.dart';
import '../../../../../config/config.dart';
import '../../../application/application.dart';

class CustomChips extends StatelessWidget {
  const CustomChips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocBuilder<MangaDetailBloc, MangaDetailState>(
        buildWhen: (pre, cur) => pre.runtimeType != cur.runtimeType,
        builder: (_, state) {
          if (state is MangaDetailSuccessState) {
            return Wrap(
              spacing: 5,
              runSpacing: 5,
              children: List.generate(
                state.mangaDetail.listGenres?.length ?? 0,
                (index) => Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 7,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IrohaText.regular(
                    state.mangaDetail.listGenres![index].name!,
                    fontSize: FontSizes.s11,
                  ),
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
