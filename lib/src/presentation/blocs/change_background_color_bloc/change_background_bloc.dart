import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../../config/config.dart';
import '../../../domain/usecaes/setting_app/get_background_reading_usecase.dart';
import '../../../domain/usecaes/setting_app/update_background_reading_usecase.dart';

part 'change_background_event.dart';

part 'change_background_state.dart';

@injectable
class ChangeBackgroundBloc
    extends Bloc<ChangeBackgroundEvent, ChangeBackgroundState> {
  ChangeBackgroundBloc(
    this._getUsecase,
    this._setUsecase,
  ) : super(ChangeBackgroundState.black()) {
    on<GetBackgroundColor>(_getBackground);
    on<SetBackgroundReading>(_setBackground);
  }

  final SetBackgroundReadingUseCase _setUsecase;
  final GetBackgroundReadingUseCase _getUsecase;

  Future<void> _getBackground(
    GetBackgroundColor event,
    Emitter<ChangeBackgroundState> emit,
  ) async {
    final either = await _getUsecase();
    either.fold(
      _getFailureAndThrowExpection,
      (r) => _updateBackground(r, emit),
    );
  }

  Future<void> _setBackground(
    SetBackgroundReading event,
    Emitter<ChangeBackgroundState> emit,
  ) async {
    for (var theme in Constants.listBackgroundColor) {
      if (event.type.name == theme.type.name) {
        final params = SetBackgroundReadingParams(event.type.name);
        final result = await _setUsecase(params: params);
        result.fold(
          _getFailureAndThrowExpection,
          (r) => null,
        );
        break;
      }
    }
    add(GetBackgroundColor());
  }

  void _updateBackground(
    String theme,
    Emitter<ChangeBackgroundState> emit,
  ) {
    if (theme == Constants.listBackgroundColor[0].name) {
      emit(ChangeBackgroundState.black());
    } else if (theme == Constants.listBackgroundColor[1].name) {
      emit(ChangeBackgroundState.white());
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
