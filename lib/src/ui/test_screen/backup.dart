// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:html/parser.dart';
// import 'package:irohasu/src/components/custom_bottom_nav_bar.dart';
// import 'package:irohasu/src/ui/home_screens/item_manga.dart';
// import 'package:irohasu/src/constants/base_blogtruyen.dart';
//
// import '../../models/list_manga_model.dart';
//
// class RecentScreen extends StatefulWidget {
//   @override
//   _RecentScreenState createState() => _RecentScreenState();
// }
//
// class _RecentScreenState extends State<RecentScreen> {
//   final mangaData = <ListManga>[];
//   final mangaStream = StreamController<List<ListManga>>();
//
//   void getInfoManga() async {
//     final client = http.Client();
//     http.Response response = await client.get(BlogTruyen.baseUrl);
//     if (response.statusCode == 200) {
//       final document = parse(response.body);
//       final listManga = document.getElementsByClassName('storyitem');
//       for (final manga in listManga) {
//         final infoManga = manga.children;
//         try {
//           mangaData.add(
//             ListManga(
//               title: infoManga[0]
//                   .querySelector('a')
//                   .attributes['title']
//                   .toString(),
//               thumbnailUrl: infoManga[0]
//                   .querySelector('img')
//                   .attributes['src']
//                   .toString(),
//               setUrlWithoutDomain:
//               infoManga[0].querySelector('a').attributes['href'].toString(),
//             ),
//           );
//         } catch (e) {}
//       }
//       mangaStream.sink.add(mangaData);
//     } else {
//       print("Something get wrong! Status code ${response.statusCode}");
//     }
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // headers = getHeaders();
//     getInfoManga();
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     mangaStream.close();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Scaffold(
//             backgroundColor: Colors.transparent,
//             appBar: AppBar(
//               title: Text(
//                 BlogTruyen.name,
//                 style: TextStyle(color: Colors.black87, fontSize: 22),
//               ),
//               backgroundColor: Colors.transparent,
//               elevation: 0.0,
//               centerTitle: true,
//               actions: <Widget>[
//                 IconButton(
//                     icon: Icon(
//                       Icons.search,
//                       color: Colors.black87,
//                     ),
//                     onPressed: null),
//                 IconButton(
//                     icon: Icon(
//                       Icons.dashboard,
//                       color: Colors.black87,
//                     ),
//                     onPressed: null),
//                 Stack(children: [
//                   Container(
//                     margin: EdgeInsets.only(right: 10),
//                     child: CircleAvatar(
//                       child: ClipOval(
//                         child: Image.asset('assets/images/Yuigahama.jpg'),
//                       ),
//                     ),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black87,
//                           blurRadius: 3,
//                         )
//                       ],
//                     ),
//                   ),
//                 ]),
//               ],
//             ),
//             body: StreamBuilder<List<ListManga>>(
//                 stream: mangaStream.stream,
//                 initialData: null,
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return Container(
//                       child: Center(
//                         child: CircularProgressIndicator(),
//                       ),
//                     );
//                   }
//
//                   final data = snapshot.data;
//
//                   return Container(
//                     decoration: BoxDecoration(color: Colors.black),
//                     child: GridView.builder(
//                       padding: EdgeInsets.all(12),
//                       itemCount: data.length,
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         childAspectRatio: 0.7,
//                         crossAxisCount: 3,
//                         crossAxisSpacing: 8,
//                         mainAxisSpacing: 8,
//                       ),
//                       itemBuilder: (context, index) {
//                         return ItemManga(
//                           title: data[index].title,
//                           thumbnailUrl: data[index].thumbnailUrl,
//                           setUrlWithoutDomain: data[index].setUrlWithoutDomain,
//                         );
//                       },
//                     ),
//                   );
//                 }),
//           ),
//         ],
//       ),
//       bottomNavigationBar: CustomBottomNavBar(),
//     );
//   }
// }
