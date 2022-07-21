import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/config.dart';
import '../../../../core/core.dart';
import '../../../shared/domain/usecase/setting_app/get_reading_mode_usecase.dart';
import '../../../shared/domain/usecase/setting_app/update_reading_mode_usecase.dart';


part 'change_reading_mode_event.dart';
part 'change_reading_mode_state.dart';

@injectable
class ChangeReadingModeBloc
    extends Bloc<ChangeReadingModeEvent, ChangeReadingModeState> {
  ChangeReadingModeBloc(
    this._getReadingModeUseCase,
    this._setReadingModeUseCase,
  ) : super(AdvancedReadingModeState()) {
    on<GetReadingMode>(_getMode);
    on<UpdateReadingMode>(_setMode);
  }

  final SetReadingModeUseCase _setReadingModeUseCase;
  final GetReadingModeUseCase _getReadingModeUseCase;

  Future<void> _getMode(
    GetReadingMode event,
    Emitter<ChangeReadingModeState> emit,
  ) async {
    final either = await _getReadingModeUseCase();
    either.fold(
      _getFailureAndThrowExpection,
      (r) => _updateMode(r, emit),
    );
  }

  Future<void> _setMode(
    UpdateReadingMode event,
    Emitter<ChangeReadingModeState> emit,
  ) async {
    for (var theme in Constants.listReadingMode) {
      if (event.type.name == theme.type.name) {
        final params = SetReadingModeParams(event.type.name);
        final result = await _setReadingModeUseCase(params: params);
        result.fold(
          _getFailureAndThrowExpection,
          (r) => null,
        );
        break;
      }
    }
    add(GetReadingMode());
  }

  void _updateMode(
    String theme,
    Emitter<ChangeReadingModeState> emit,
  ) {
    if (theme == Constants.listReadingMode[0].name) {
      emit(AdvancedReadingModeState());
    } else if (theme == Constants.listReadingMode[1].name) {
      emit(WebtoonModeState());
    }
  }

  Exception _getFailureAndThrowExpection(Failure l) {
    if (l is ServerFailure) {
      return ServerException();
    } else if (l is CacheFailure) {
      return CacheException();
    } else {
      return UnknownException();
    }
  }
}
