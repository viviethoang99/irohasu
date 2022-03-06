part of 'horizatal_mode_bloc.dart';

abstract class HorizatalModeEvent extends Equatable {
  const HorizatalModeEvent();

  @override
  List<Object> get props => [];
}

class SheetMovedChange extends HorizatalModeEvent {
  const SheetMovedChange({
    required this.currentPosition,
    required this.relativeToSheetHeight,
  });

  final double currentPosition;
  final double relativeToSheetHeight;

  @override
  List<Object> get props => [currentPosition, relativeToSheetHeight];
}

class ShowInfo extends HorizatalModeEvent {}
