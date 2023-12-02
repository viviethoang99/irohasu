import 'package:flutter/material.dart';

typedef HoverBuilder = Widget Function(BuildContext context, bool onHover);

class IrohaHover extends StatefulWidget {
  const IrohaHover({
    super.key,
    this.builder,
    this.child,
    this.style,
    this.isSelected,
    this.onHover,
    this.cursor,
    this.buildWhenOnHover,
  });
  final HoverStyle? style;
  final HoverBuilder? builder;
  final Widget? child;

  final bool Function()? isSelected;
  final void Function(bool)? onHover;
  final MouseCursor? cursor;

  /// Determined whether the [builder] should get called when onEnter/onExit
  /// happened
  ///
  /// [IrohaHover] show hover when [MouseRegion]'s onEnter get called
  /// [IrohaHover] hide hover when [MouseRegion]'s onExit get called
  ///
  final bool Function()? buildWhenOnHover;

  @override
  State<IrohaHover> createState() => _IrohaHoverState();
}

class _IrohaHoverState extends State<IrohaHover> {
  bool _onHover = false;

  @override
  void didUpdateWidget(covariant IrohaHover oldWidget) {
    // Reset the _onHover to false when the parent widget get rebuild.
    _onHover = false;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    var showHover = _onHover;
    if (!showHover && widget.isSelected != null) {
      showHover = widget.isSelected!();
    }

    final child = widget.child ?? widget.builder!(context, _onHover);
    final style = widget.style ??
        HoverStyle(hoverColor: Theme.of(context).colorScheme.secondary);
    if (showHover) {
      return IrohaHoverContainer(
        style: style,
        child: child,
      );
    }
    return ColoredBox(
      color: style.backgroundColor,
      child: child,
    );
  }
}

class HoverStyle {
  const HoverStyle({
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
    this.borderRadius = const BorderRadius.all(Radius.circular(6)),
    this.contentMargin = EdgeInsets.zero,
    this.backgroundColor = Colors.transparent,
    this.hoverColor,
  });

  final Color borderColor;
  final double borderWidth;
  final Color? hoverColor;
  final BorderRadius borderRadius;
  final EdgeInsets contentMargin;
  final Color backgroundColor;
}

class IrohaHoverContainer extends StatelessWidget {
  const IrohaHoverContainer({
    super.key,
    this.child,
    required this.style,
  });
  final HoverStyle style;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final hoverBorder = Border.all(
      color: style.borderColor,
      width: style.borderWidth,
    );

    return Container(
      margin: style.contentMargin,
      decoration: BoxDecoration(
        border: hoverBorder,
        color: style.hoverColor ?? Theme.of(context).colorScheme.secondary,
        borderRadius: style.borderRadius,
      ),
      child: child,
    );
  }
}
