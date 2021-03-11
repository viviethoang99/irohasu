import 'package:flutter/material.dart';
import 'package:irohasu/src/models/genres_model.dart';
import '../../../../src/constants/base_content.dart';

class DescriptionTextWidget extends StatefulWidget {
  DescriptionTextWidget({@required this.text, this.listGenres});

  final String text;
  final List<Genres> listGenres;

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
                  Content.about,
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

  Widget customButtonDescription({String status, IconData icon}) {
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
                      .bodyText1
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
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: 16,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis)
              : Text(
                  text,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: 16,
                      ),
                ),
        ),
        if (!_isMoreThan100Characters || !flag)
          CustomChips(flag: flag, widget: widget),
      ],
    );
  }
}

class CustomChips extends StatelessWidget {
  const CustomChips({
    Key key,
    @required this.flag,
    @required this.widget,
  }) : super(key: key);

  final bool flag;
  final DescriptionTextWidget widget;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      // margin: const EdgeInsets.only(top: 7.0, bottom: 5.0),
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.listGenres.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
                child: ActionChip(
                padding: const EdgeInsets.all(2.0),
                label: Text(
                  widget.listGenres[index].genreName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: theme.primaryColor,
                  ),
                ),
                onPressed: () {},
                backgroundColor: theme.backgroundColor,
                shape: StadiumBorder(
                    side: BorderSide(
                  width: 2.5,
                  color: theme.buttonColor,
                )),
              ),
            );
          }),
    );
  }
}
