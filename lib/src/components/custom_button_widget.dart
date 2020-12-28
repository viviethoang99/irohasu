// import 'package:flutter/material.dart';
//
// class CustomButtonWidget extends StatefulWidget {
//   CustomButtonWidget({this.status, this.icon, this.flag});
//
//   String status;
//   Object icon;
//   bool flag;
//
//   @override
//   _CustomButtonWidgetState createState() => _CustomButtonWidgetState();
// }
//
// class _CustomButtonWidgetState extends State<CustomButtonWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//         type: MaterialType.transparency,
//         child: Ink(
//           padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.green, width: 2),
//             borderRadius: BorderRadius.circular(20.0),
//           ),
//           child: InkWell(
//             onTap: () {
//               setState(() {
//                 set widget.flag(bool widget.flag)
//                 =>
//                 false;
//               });
//             },
//             child: Row(
//               children: <Widget>[
//                 const Icon(Icons.keyboard_arrow_down, color: Colors.white,),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   widget.status,
//                   style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                       color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
