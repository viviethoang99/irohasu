import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../../chapter.dart';

class ProcessReadingChapter extends StatelessWidget {
  const ProcessReadingChapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<HorizatalModeBloc, HorizatalModeState>(
      builder: (context, state) {
        return Positioned(
          bottom: 40 + state.currentPosition,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            opacity: context.watch<HorizatalModeBloc>().opacityProcess,
            child: Container(
              alignment: Alignment.center,
              height: 60,
              width: SizeConfig.screenWidth - 30,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: theme.backgroundColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(40),
              ),
              child: const _ControlWidget(),
            ),
          ),
        );
      },
    );
  }
}

class _ControlWidget extends StatelessWidget {
  const _ControlWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        BlocSelector<ChapterScreenCubit, ChapterScreenState, String?>(
          selector: (state) => state.chapter?.prevChapter ?? '',
          builder: (context, state) {
            print(state);

            if (state?.isEmpty ?? true) {
              return const Icon(
                Icons.skip_previous,
                color: Colors.grey,
              );
            }
            return InkWell(
              onTap: context.read<ChapterScreenCubit>().prevChap,
              child: const Icon(
                Icons.skip_previous,
              ),
            );
          },
        ),
        const SizedBox(width: 15),
        Text(
          context.watch<ManagePagesCubit>().current,
          style: TextStyle(
            color: theme.primaryColor,
            fontSize: 14,
          ),
        ),
        BlocBuilder<ManagePagesCubit, ManagePagesState>(
          builder: (context, state) {
            return Expanded(
              child: Slider(
                min: 0,
                max: state.totalPages.toDouble(),
                value: state.currentPage.toDouble(),
                divisions: state.totalPages,
                label: '${state.currentPage.round() + 1}',
                onChanged: context.read<ManagePagesCubit>().changePage,
              ),
            );
          },
        ),
        Text(
          context.watch<ManagePagesCubit>().total,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 15),
        BlocSelector<ChapterScreenCubit, ChapterScreenState, String?>(
          selector: (state) => state.chapter?.nextChapter ?? '',
          builder: (context, state) {
            print(state);
            if (state?.isEmpty ?? true) {
              return const Icon(
                Icons.skip_next,
                color: Colors.grey,
              );
            }
            return InkWell(
              onTap: context.read<ChapterScreenCubit>().nextChap,
              child: const Icon(
                Icons.skip_next,
              ),
            );
          },
        ),
      ],
    );
  }
}
