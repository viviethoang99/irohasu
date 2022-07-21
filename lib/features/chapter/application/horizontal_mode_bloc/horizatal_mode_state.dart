part of 'horizatal_mode_bloc.dart';

class HorizatalModeState extends Equatable {
  const HorizatalModeState({
    this.currentPosition = 0.0,
    this.sheetHeight = 0.0,
    this.showInfo = false,
  });

  final double currentPosition;
  final double sheetHeight;
  final bool showInfo;

  HorizatalModeState copyWith({
    double? currentPosition,
    double? sheetHeight,
    bool? showInfo,
  }) {
    return HorizatalModeState(
      sheetHeight: sheetHeight ?? this.sheetHeight,
      showInfo: showInfo ?? this.showInfo,
      currentPosition: currentPosition ?? this.currentPosition,
    );
  }

  @override
  List<Object> get props => [
        currentPosition,
        sheetHeight,
        showInfo,
      ];
}
