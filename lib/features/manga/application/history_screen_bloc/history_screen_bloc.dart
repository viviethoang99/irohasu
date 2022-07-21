import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/manga_detail.dart';


part 'history_screen_event.dart';
part 'history_screen_state.dart';

class HistoryScreenBloc extends Bloc<HistoryScreenEvent, HistoryScreenState> {
  HistoryScreenBloc()
      : 
        super(const HistoryScreenState()) {
    on<FetchDataHistory>(_fetchData);
  }


  void _fetchData(FetchDataHistory event, Emitter<HistoryScreenState> emit) {}
}
