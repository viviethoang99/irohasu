import 'package:flutter/material.dart';

import '../../../widgets/custom_chip.dart';

class DescriptionTextWidget extends StatefulWidget {
  const DescriptionTextWidget({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget>
    with TickerProviderStateMixin {
  String get text => widget.text;

  late bool flag;
  bool _isMoreThan100Characters = false;

  @override
  void initState() {
    super.initState();
    flag = false;
    _isMoreThan100Characters = (widget.text.length >= 100);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AnimatedSize(
        curve: Curves.easeInSine,
        duration: const Duration(milliseconds: 300),
        child: Container(
          padding: _isMoreThan100Characters
              ? const EdgeInsets.symmetric(vertical: 10.0)
              : const EdgeInsets.only(bottom: 10.0),
          child: showTextDescription(),
        ),
      ),
    );
  }

  Widget showTextDescription() {
    return InkWell(
      onTap: () {
        if (_isMoreThan100Characters) {
          setState(() => flag = !flag);
        }
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 15,
                      letterSpacing: 0.75,
                    ),
                maxLines: flag ? 2 : null,
                overflow: flag ? TextOverflow.ellipsis : null,
              ),
              if (flag)
                _ButtonShowMore(
                  title: 'Xem thêm',
                  color: widget.color,
                  icon: Icons.expand_more,
                ),
            ],
          ),
          const SizedBox(height: 5),
          if (!_isMoreThan100Characters || !flag) const CustomChips(),
          if (_isMoreThan100Characters && !flag)
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: _ButtonShowMore(
                  title: 'Thu gọn',
                  color: widget.color,
                  icon: Icons.expand_less,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ButtonShowMore extends StatelessWidget {
  const _ButtonShowMore({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final Color color;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor.withOpacity(0.9),
      padding: const EdgeInsets.all(2).copyWith(
        bottom: 0,
        left: 5,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: color,
                  fontSize: 12,
                  letterSpacing: 0.75,
                ),
          ),
          Icon(icon, color: color),
        ],
      ),
    );
  }
}
