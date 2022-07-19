part of '../horizontal_screen.dart';

class _AppBarWidget extends StatelessWidget {
  const _AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HorizatalModeBloc, HorizatalModeState>(
      builder: (context, state) {
        final theme = Theme.of(context);
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          top: state.showInfo ? 0 : -200,
          width: SizeConfig.screenWidth,
          height: Constants.heightAppBar,
          child: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: theme.primaryColor,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            centerTitle: true,
            backgroundColor: theme.backgroundColor.withOpacity(0.9),
            elevation: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  context.watch<MangaInfoCubit>().nameManga,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: theme.primaryColor,
                    fontSize: 17,
                  ),
                ),
                Text(
                  context.watch<ChapterScreenCubit>().nameChapter,
                  style: TextStyle(
                    color: theme.primaryColor.withOpacity(0.5),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
