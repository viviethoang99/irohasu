import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/manga_detail_bloc/bloc.dart';
import '../../../config/base_content.dart';

class DescriptionTextWidget extends StatefulWidget {
  DescriptionTextWidget({required this.text});

  final String text;

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget>
    with TickerProviderStateMixin {
  String get text => widget.text;

  bool flag = true;
  bool _isMoreThan100Characters = false;

  @override
  void initState() {
    super.initState();
    _isMoreThan100Characters = (widget.text.length >= 100);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  ConstantStrings.about,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              if (_isMoreThan100Characters)
                flag
                    ? customButtonDescription(
                        status: 'Hiện', icon: Icons.keyboard_arrow_down)
                    : customButtonDescription(
                        status: 'Ẩn', icon: Icons.keyboard_arrow_up),
            ],
          ),
          AnimatedSize(
            curve: Curves.easeInSine,
            duration: const Duration(milliseconds: 300),
            vsync: this,
            child: Container(
              margin: const EdgeInsets.only(top: 8),
              padding: _isMoreThan100Characters
                  ? const EdgeInsets.symmetric(vertical: 20.0)
                  : const EdgeInsets.only(bottom: 10.0),
              child: showTextDescription(),
            ),
          ),
        ],
      ),
    );
  }

  Widget customButtonDescription({required String status, IconData? icon}) {
    return Material(
        type: MaterialType.transparency,
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).buttonColor, width: 2),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              setState(() => flag = !flag);
            },
            child: Row(
              children: <Widget>[
                Icon(icon, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8),
                Text(
                  status,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
          ),
        ));
  }

  Widget showTextDescription() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: flag
              ? Text(text,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis)
              : Text(
                  text,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                      ),
                ),
        ),
        if (!_isMoreThan100Characters || !flag) const CustomChips(),
      ],
    );
  }
}

class CustomChips extends StatelessWidget {
  const CustomChips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: BlocBuilder<MangaDetailBloc, MangaDetailState>(
        buildWhen: (pre, cur) => pre.runtimeType != cur.runtimeType,
        builder: (_, state) {
          if (state is MangaDetailSuccessState) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: state.mangaDetail.listGenres?.length ?? 0,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: ActionChip(
                    padding: const EdgeInsets.all(2.0),
                    label: Text(
                      state.mangaDetail.listGenres![index].genreName!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onPressed: () {},
                    backgroundColor: Theme.of(context).backgroundColor,
                    shape: StadiumBorder(
                      side: BorderSide(
                        width: 2.5,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
