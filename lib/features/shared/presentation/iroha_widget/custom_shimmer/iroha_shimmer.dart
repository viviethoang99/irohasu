import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class IrohaShimmer extends StatelessWidget {
  const IrohaShimmer({
    Key? key,
    this.isLoading = true,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Shimmer.fromColors(
            enabled: true,
            baseColor: const Color(0xffECEAEC),
            highlightColor: const Color(0xffE3E1E3),
            period: const Duration(milliseconds: 1000),
            child: child,
          )
        : child;
  }
}
