import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    Key? key,
    this.isChecked,
    this.size,
    this.iconSize,
    this.selectedColor,
    this.iconStatus,
    this.onClick,
  }): super(key: key);

  final bool? isChecked;
  final double? size;
  final double? iconSize;
  final Color? selectedColor;
  final IconData? iconStatus;
  final Function? onClick;

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick as void Function()?,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
            color: widget.selectedColor,
            borderRadius: BorderRadius.circular(5.0),
            border: (widget.selectedColor != null)
                ? null
                : Border.all(
                    color: Colors.grey,
                    width: 2.0,
                  )),
        width: widget.size ?? 30,
        height: widget.size ?? 30,
        child: Icon(
          widget.iconStatus,
          color: Theme.of(context).backgroundColor,
        ),
      ),
    );
  }
}
