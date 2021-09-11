part of 'horizontal_reading_cubit.dart';

class HorizontalReadingState extends Equatable {
  const HorizontalReadingState({
    this.showMenu = false,
    this.showBottomMenu = false,
    this.indexPage = 0,
    this.chapter,
    required this.scrollController,
    required this.pageController,
  });

  final ChapterModel? chapter;
  final bool showMenu;
  final bool showBottomMenu;
  final int indexPage;
  final ItemScrollController scrollController;
  final PageController pageController;

  HorizontalReadingState copyWith({
    bool? showMenu,
    bool? showBottomMenu,
    int? indexPage,
    ChapterModel? chapter,
    ItemScrollController? scrollController,
    PageController? pageController,
  }) {
    return HorizontalReadingState(
      showMenu: showMenu ?? this.showMenu,
      showBottomMenu: showBottomMenu ?? this.showBottomMenu,
      indexPage: indexPage ?? this.indexPage,
      chapter: chapter ?? this.chapter,
      scrollController: scrollController ?? this.scrollController,
      pageController: pageController ?? this.pageController,
    );
  }

  @override
  List<Object?> get props => [
        showMenu,
        indexPage,
        showBottomMenu,
        chapter,
        scrollController,
        pageController,
      ];
}
