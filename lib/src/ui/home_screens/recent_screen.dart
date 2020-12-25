//
import 'package:flutter/material.dart';
//
import 'package:flutter_bloc/flutter_bloc.dart';
// Widget
import '../../blocs/list_manga_bloc/bloc.dart';
import '../../components/custom_bottom_nav_bar.dart';
import 'item_manga.dart';
import '../../constants/base_blogtruyen.dart';

class RecentScreen extends StatefulWidget {
  static const routeName = '/recent';

  @override
  _RecentScreenState createState() => _RecentScreenState();
}

class _RecentScreenState extends State<RecentScreen> {
  ListMangaBloc _listMangaBloc;

  @override
  void initState() {
    super.initState();
    _listMangaBloc = BlocProvider.of<ListMangaBloc>(context);
    _listMangaBloc.add(FetchListMangaEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                BlogTruyen.name,
                style: TextStyle(color: Colors.black87, fontSize: 22),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black87,
                    ),
                    onPressed: null),
                IconButton(
                    icon: Icon(
                      Icons.dashboard,
                      color: Colors.black87,
                    ),
                    onPressed: null),
                Stack(children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      child: ClipOval(
                        child: Image.asset('assets/images/Yuigahama.jpg'),
                      ),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87,
                          blurRadius: 3,
                        )
                      ],
                    ),
                  ),
                ]),
              ],
            ),
            body: BlocBuilder<ListMangaBloc, ListMangaState>(
                builder: (context, state) {
                  if (state is ListMangaLoadingState) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if(state is InitialListMangaState){
                    return Center();
                  }
                  if (state is ListMangaLoadedState) {
                    return Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: GridView.builder(
                        padding: EdgeInsets.all(12),
                        itemCount: state.data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.7,
                          crossAxisCount: 3,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 2,
                        ),
                        itemBuilder: (context, index) {
                          return ItemManga(
                            title: state.data[index].title,
                            thumbnailUrl: state.data[index].thumbnailUrl,
                            setUrlWithoutDomain: state.data[index].setUrlWithoutDomain,
                          );
                        },
                      ),
                    );
                  }
                  return Center(child: Text('Other states..'));
                  //never run this line, only fix warning.
                }),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
