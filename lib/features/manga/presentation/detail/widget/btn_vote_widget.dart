import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/text.dart';
import '../../../../../config/constants/size.dart';
import '../../../manga.dart';

class BtnVoteWidget extends StatelessWidget {
  const BtnVoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MangaDetailBloc, MangaDetailState, MangaDetail?>(
      selector: (state) => state.mangaDetail,
      builder: (context, state) {
        if (state != null) {
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
                '${state.like ?? 0}',
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
                '${state.dislike ?? 0}',
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
