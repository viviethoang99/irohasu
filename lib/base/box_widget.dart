import 'package:flutter/material.dart';

import 'decoration.dart';

class BoxWidget extends StatelessWidget {
  const BoxWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: IrohaDecoration.decoration(
        Theme.of(context).cardColor,
        Theme.of(context).colorScheme.shadow.withOpacity(0.15),
      ),
      child: child,
    );
  }
}
