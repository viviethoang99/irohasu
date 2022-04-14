import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'horizatal_mode_event.dart';
part 'horizatal_mode_state.dart';

class HorizatalModeBloc extends Bloc<HorizatalModeEvent, HorizatalModeState> {
  HorizatalModeBloc() : super(const HorizatalModeState()) {
    on<SheetMovedChange>(_sheetMovedChange);
    on<ShowInfo>(_showInfo);
  }

  Future<void> _sheetMovedChange(
    SheetMovedChange event,
    Emitter<HorizatalModeState> emit,
  ) async {
    if (event.relativeToSheetHeight <= 0.5) {
      emit(state.copyWith(
        sheetHeight: event.relativeToSheetHeight,
        currentPosition: event.currentPosition,
      ));
    } else {
      emit(state.copyWith(
        currentPosition: event.currentPosition,
      ));
    }
  }

  Future<void> _showInfo(
    ShowInfo event,
    Emitter<HorizatalModeState> emit,
  ) async {
    final isShowDialog = !state.showInfo;
    emit(HorizatalModeState(showInfo: isShowDialog));
  }

  double get opacityProcess {
    if (state.currentPosition < 50) return 1;
    final value = 1 - state.sheetHeight * 2;
    return value < 0 || value > 1 ? value.round().toDouble() : value;
  }
}
