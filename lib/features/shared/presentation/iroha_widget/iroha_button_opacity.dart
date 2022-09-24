import 'package:flutter/material.dart';

class IrohaButtonOpacity extends StatefulWidget {
  const IrohaButtonOpacity({
    super.key,
    required this.child,
    required this.onTap,
    this.opacityValue = 0.8,
  });

  final Widget child;
  final double opacityValue;
  final VoidCallback onTap;

  @override
  State<IrohaButtonOpacity> createState() => _IrohaButtonOpacityState();
}

class _IrohaButtonOpacityState extends State<IrohaButtonOpacity> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => changeValue(true),
      onTapCancel: () => changeValue(false),
      onTapUp: (_) => widget.onTap(),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: _isTapped ? widget.opacityValue : 1,
        child: widget.child,
      ),
    );
  }

  void changeValue(bool value) {
    setState(() => _isTapped = value);
  }
}
