part of 'change_background_bloc.dart';

@immutable
class ChangeBackgroundState {
  ChangeBackgroundState({this.color, this.string, this.selectOption});

  factory ChangeBackgroundState.white() {
    return ChangeBackgroundState(
      color: Colors.white,
      string: 'Trắng',
      selectOption: 0,
    );
  }

  factory ChangeBackgroundState.black() {
    return ChangeBackgroundState(
      color: Colors.black87,
      string: 'Đen',
      selectOption: 1,
    );
  }

  final String string;
  final Color color;
  final int selectOption;
}
