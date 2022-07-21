import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/config.dart';
import '../../../../config/themes/app_theme_data.dart';
import '../../../../core/core.dart';
import '../../domain/usecase/setting_app/get_setting_app_usecase.dart';
import '../../domain/usecase/setting_app/update_setting_app_usecase.dart';


part 'change_theme_event.dart';
part 'change_theme_state.dart';

@injectable
class ChangeThemeBloc extends Bloc<ChangeThemeEvent, ChangeThemeState> {
  ChangeThemeBloc(
    this._getThemeApp,
    this._setThemeApp,
  ) : super(ChangeThemeState.lightTheme()) {
    on<GetTheme>(_getTheme);
    on<SetTheme>(_setTheme);
  }

  final GetThemeAppUseCase _getThemeApp;
  final SetThemeAppUseCase _setThemeApp;

  Future<void> _setTheme(
    SetTheme event,
    Emitter<ChangeThemeState> emit,
  ) async {
    for (var theme in Constants.listTheme) {
      if (event.type.name == theme.type.name) {
        final params = SetThemeAppParams(event.type.name);
        final result = await _setThemeApp(params: params);
        result.fold(
          _getFailureAndThrowExpection,
          (r) => null,
        );
        break;
      }
    }
    add(GetTheme());
  }

  Future<void> _getTheme(
    GetTheme event,
    Emitter<ChangeThemeState> emit,
  ) async {
    final either = await _getThemeApp();
    either.fold(
      _getFailureAndThrowExpection,
      (r) => _updateTheme(r, emit),
    );
  }

  void _updateTheme(
    String theme,
    Emitter<ChangeThemeState> emit,
  ) {
    if (theme == Constants.listTheme[0].type.name) {
      emit(ChangeThemeState.lightTheme());
    } else if (theme == Constants.listTheme[1].type.name) {
      emit(ChangeThemeState.blackTheme());
    } else if (theme == Constants.listTheme[2].type.name) {
      emit(ChangeThemeState.darkTheme());
    } else if (theme == Constants.listTheme[3].type.name) {
      emit(ChangeThemeState.lightBlackTheme());
    } else {
      emit(ChangeThemeState.lightTheme());
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
