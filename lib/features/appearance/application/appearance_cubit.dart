import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../config/config.dart';
import '../../../core/core.dart';

part 'appearance_state.dart';
part 'appearance_cubit.freezed.dart';

const _white = Color.fromARGB(255, 160, 121, 121);

@singleton
class AppearanceCubit extends Cubit<AppearanceState> {
  AppearanceCubit()
      : super(AppearanceState.initial(
          font: 'BeVietnam',
          monospaceFont: 'mono',
          themeMode: ThemeMode.dark,
        ));

  void setThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }
}
