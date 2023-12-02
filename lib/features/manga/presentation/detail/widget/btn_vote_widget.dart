import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/text.dart';
import '../../../../../config/constants/size.dart';
import '../../../manga.dart';

class BtnVoteWidget extends StatelessWidget {
  const BtnVoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MangaDetailBloc, MangaDetailState>(
      buildWhen: (pre, cur) => pre.runtimeType != cur.runtimeType,
      builder: (context, state) {
        if (state is MangaDetailSuccessState) {
          return Row(
            children: <Widget>[
              const IconButton(
                icon: Icon(
                  Icons.thumb_up,
                  color: Colors.green,
                ),
                onPressed: null,
              ),
              IrohaText.medium(
                '${state.mangaDetail.like ?? 0}',
                fontSize: FontSizes.s16,
              ),
              const IconButton(
                icon: Icon(
                  Icons.thumb_down,
                  color: Colors.red,
                ),
                onPressed: null,
              ),
              IrohaText.medium(
                '${state.mangaDetail.dislike ?? 0}',
                fontSize: FontSizes.s16,
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
