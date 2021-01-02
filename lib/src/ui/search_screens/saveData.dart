// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:irohasu/src/constants/base_blogtruyen.dart';
// import '../../../src/blocs/search_bloc/bloc.dart';
//
// class SearchScreen extends StatefulWidget {
//   static const routeName = '/search';
//
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   SearchBloc _searchBloc;
//
//   @override
//   void initState() {
//     super.initState();
//     _searchBloc = BlocProvider.of<SearchBloc>(context)
//       ..add(FetchDataSearchEvent());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         actions: <Widget>[
//           IconButton(
//             onPressed: () {
//               // showSearch(context: context, delegate: Search(widget.list));
//             },
//             icon: Icon(Icons.search),
//           )
//         ],
//         centerTitle: true,
//         title: Text('Search Bar'),
//       ),
//       body: BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
//         if (state is InitialSearchState) {
//           return Container(
//             child: const Center(),
//           );
//         }
//         if (state is SearchLoadingState) {
//           return Container(
//             child: const Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }
//         if (state is SearchLoadedState) {
//           return Container(
//             child: ListView.separated(
//                 itemBuilder: (BuildContext context, index) {
//                   return ListTile(
//                     dense: true,
//                     leading: Image.network(
//                       state.list[index].thumbnailUrl,
//                       headers: BlogTruyen.headersBuilder,
//                       errorBuilder: (BuildContext context, Object exception,
//                           StackTrace stackTrace) {
//                         return Image.asset('assets/images/404.png');
//                       },
//                     ),
//                     title: Text(state.list[index].title),
//                     isThreeLine: true,
//                     subtitle: Text(state.list[index].setUrlWithoutDomain),
//                   );
//                 },
//                 separatorBuilder: (BuildContext context, int index) =>
//                 const Divider(
//                   color: Colors.white54,
//                 ),
//                 itemCount: state.list.length),
//           );
//         }
//         return const Center(child: Text('Other states..'));
//       }),
//     );
//   }
// }
