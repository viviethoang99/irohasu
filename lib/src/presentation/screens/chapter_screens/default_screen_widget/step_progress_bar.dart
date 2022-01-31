import 'package:flutter/material.dart';
import '../../../../core/helper/size_config.dart';

class StepProgressBar extends StatelessWidget {
  const StepProgressBar({Key? key, this.currentStep, this.totalSteps})
      : super(key: key);

  final int? currentStep;
  final int? totalSteps;

  @override
  Widget build(BuildContext context) {
    final screenWidth = SizeConfig.screenWidth * 0.7;
    // if you are wrapping this widget in some padding
    const leftPadding = 10.0;
    const rightPadding = 10.0;

    // width of the separate widget
    const separatedWidth = 0.5;

    return Padding(
      padding: const EdgeInsets.only(
          top: 10, left: leftPadding, right: rightPadding, bottom: 10),
      child: Container(
        constraints: BoxConstraints(maxHeight: 10, maxWidth: screenWidth),
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: totalSteps,
          itemBuilder: (context, position) {
            return Container(
              width: (screenWidth -
                      ((totalSteps! - 1) * separatedWidth) -
                      (leftPadding + rightPadding)) /
                  totalSteps!,
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              child: Container(
                height: 5,
                decoration: BoxDecoration(
                  color: currentStep! >= position
                      ? Colors.white
                      : Colors.transparent,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
