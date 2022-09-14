part of '../horizontal_screen.dart';

class _ShowChapterFromAPI extends StatefulWidget {
  const _ShowChapterFromAPI({Key? key}) : super(key: key);

  @override
  State<_ShowChapterFromAPI> createState() => __ShowChapterFromAPIState();
}

class __ShowChapterFromAPIState extends State<_ShowChapterFromAPI> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prePage = SizeConfig.screenWidth * 0.3;
    final nextPage = SizeConfig.screenWidth * 0.7;
    return BlocConsumer<ManagePagesCubit, ManagePagesState>(
      listenWhen: (pre, cur) => pre.currentPage != cur.currentPage,
      listener: (_, state) {
        _pageController.animateToPage(
          state.currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      builder: (context, state) {
        return GestureDetector(
          onTapDown: (details) {
            final possion = details.globalPosition.dx;
            if (possion < prePage) {
              context.read<ManagePagesCubit>().prePage();
            } else if (possion > nextPage) {
              context.read<ManagePagesCubit>().nextPage();
            } else {
              context.read<HorizatalModeBloc>().add(ShowInfo());
            }
          },
          child: BlocBuilder<ChapterScreenCubit, ChapterScreenState>(
            builder: (_, state) {
              return PhotoViewGallery.builder(
                itemCount: state.chapter!.listImage!.length,
                pageController: _pageController,
                scrollPhysics: const BouncingScrollPhysics(),
                builder: (context, index) {
                  final image = state.chapter?.listImage?[index];
                  return PhotoViewGalleryPageOptions(
                    imageProvider: state.chapter!.isDataLocal
                        ? FileImage(File(image!.urlImage!)) as ImageProvider
                        : NetworkImage(
                            image!.urlImage!,
                            headers: ENV.headersBuilder,
                          ),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.contained * 2,
                    initialScale: PhotoViewComputedScale.contained,
                    heroAttributes: PhotoViewHeroAttributes(
                      tag: image.number!,
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
                onPageChanged: context.read<ManagePagesCubit>().changePage,
                allowImplicitScrolling: true,
                loadingBuilder: (context, event) => const Center(
                  child: SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
