import 'package:flutter/material.dart';

import '../../../../../base/spacing.dart';
import '../../../../../base/text.dart';
import '../../../../../config/constants/size.dart';
import 'custom_chip.dart';

class DescriptionTextWidget extends StatefulWidget {
  const DescriptionTextWidget({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  State<DescriptionTextWidget> createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String get text => widget.text ?? '';

  late bool flag;
  late bool _isMoreThan100Characters;

  @override
  void initState() {
    super.initState();
    flag = false;
    _isMoreThan100Characters = text.length >= 100;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(
        top: 12,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      child: AnimatedSize(
        curve: Curves.easeInSine,
        duration: const Duration(milliseconds: 300),
        child: Padding(
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
              IrohaText.regular(
                text,
                fontSize: FontSizes.s14,
                letterSpacing: 0.75,
                maxLines: flag ? 2 : null,
                overflow: flag ? TextOverflow.ellipsis : null,
              ),
              if (flag)
                const _ButtonShowMore(
                  title: 'Xem thêm',
                  icon: Icons.expand_more,
                ),
            ],
          ),
          const VSpace(5),
          if (!_isMoreThan100Characters || !flag) const CustomChips(),
          if (_isMoreThan100Characters && !flag)
            const Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(top: 5),
                child: _ButtonShowMore(
                  title: 'Thu gọn',
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
    required this.icon,
    required this.title,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.background.withOpacity(0.9),
      padding: const EdgeInsets.all(2).copyWith(
        bottom: 0,
        left: 5,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IrohaText.semibold(
            title,
            color: theme.canvasColor,
            letterSpacing: 0.75,
          ),
          Icon(
            icon,
            color: theme.canvasColor,
          ),
        ],
      ),
    );
  }
}
