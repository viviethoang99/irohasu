import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../../blocs/horizontal_mode_bloc/horizatal_mode_bloc.dart';

class ProcessReadingChapter extends StatefulWidget {
  const ProcessReadingChapter({Key? key}) : super(key: key);

  @override
  State<ProcessReadingChapter> createState() => _ProcessReadingChapterState();
}

class _ProcessReadingChapterState extends State<ProcessReadingChapter> {
  var _value = 0.0;

  double opacityItem(
    double possition,
    double sheetHeight,
  ) {
    if (possition < 50) return 1;
    final value = 1 - sheetHeight * 2;
    return value < 0 || value > 1 ? value.round().toDouble() : value;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<HorizatalModeBloc, HorizatalModeState>(
      builder: (context, state) {
        return Positioned(
          bottom: 40 + state.currentPosition,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            opacity: opacityItem(
              state.currentPosition,
              state.sheetHeight,
            ),
            child: Container(
              alignment: Alignment.center,
              height: 60,
              width: SizeConfig.screenWidth - 30,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: theme.backgroundColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.skip_previous,
                  ),
                  const SizedBox(width: 15),
                  Text(
                    '1',
                    // '${state.indexPage + 1}',
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontSize: 14,
                    ),
                  ),
                  Expanded(
                    child: Slider(
                      min: 0,
                      max: 32,
                      value: 0.5,
                      divisions: 32,
                      // max: state.chapter!.listImage!.length.toDouble(),
                      // value: _value,
                      // divisions: state.chapter!.listImage!.length,
                      label: '${_value.round()}',
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                  ),
                  Text(
                    // '${state.chapter!.listImage!.length}',
                    '32',
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Icon(
                    Icons.skip_next,
                    color: theme.primaryColor,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
