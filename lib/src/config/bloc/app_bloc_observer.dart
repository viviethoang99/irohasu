import 'dart:developer';

import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    // Do not display the return HTML.
    if (change.toString().length < 400) {
      log('onChange(${bloc.runtimeType}, $change)');
    }
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }

  // @override
  // void onCreate(BlocBase bloc) {
  //   log('${bloc.runtimeType} created');
  //   super.onCreate(bloc);
  // }

  // @override
  // void onClose(BlocBase bloc) {
  //   log('${bloc.runtimeType}  closed');
  //   super.onClose(bloc);
  // }
}
