import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../src/resources/list_manga_repo.dart';
import 'bloc.dart';

class ListMangaBloc extends Bloc<ListMangaEvent, ListMangaState> {
  final ListMangaRepo listRepo;
  ListMangaBloc(this.listRepo) : super(InitialListMangaState());

  @override
  Stream<ListMangaState> mapEventToState(ListMangaEvent event) async* {
    if (event is FetchListMangaEvent && !(state is ListMangaLoadedState)) {
      try{
        if(state is InitialListMangaState) {
          final data = await listRepo.getListManga();
          yield ListMangaLoadedState(data: data);
        } else {
          if(state is ListMangaLoadedState) {
            //load next page
            //if "next page is empty" => yield "CommentStateSuccess" with hasReachedEnd = true
            final currentState = state as ListMangaLoadedState;
            // int finalIndexOfCurrentPage = currentState.data.length;
            final comments = await listRepo.getListManga();
            if (comments.isEmpty) {
              //change current state !
              yield currentState.cloneWith(hasReachedEnd: true);
            } else {
              //not empty, means "not reached end",
              yield ListMangaLoadedState();
            }
          }
        }
      } catch(exception) {
        yield ListMangaFailureState();
      }
    }
  }
}
