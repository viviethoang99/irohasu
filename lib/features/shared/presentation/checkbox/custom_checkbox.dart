import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class CheckboxGenres extends StatelessWidget {
  const CheckboxGenres({
    Key? key,
    this.type = GenresStatus.none,
  }) : super(key: key);

  final GenresStatus type;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 18,
      height: 18,
      duration: const Duration(milliseconds: 100),
      curve: Curves.fastLinearToSlowEaseIn,
      decoration: BoxDecoration(
        color: _getColor(context),
        borderRadius: BorderRadius.circular(4.0),
        border: type != GenresStatus.none
            ? null
            : Border.all(
                color: Colors.grey,
                width: 2.0,
              ),
      ),
      child: Icon(
        _iconData,
        size: 13,
        color: Theme.of(context).backgroundColor,
      ),
    );
  }

  Color? _getColor(BuildContext context) {
    switch (type) {
      case GenresStatus.select:
        return Theme.of(context).primaryColor;
      case GenresStatus.remove:
        return Colors.redAccent;
      default:
        return null;
    }
  }

  IconData? get _iconData {
    switch (type) {
      case GenresStatus.select:
        return Icons.check;
      case GenresStatus.remove:
        return Icons.clear;
      default:
        return null;
    }
  }
}
