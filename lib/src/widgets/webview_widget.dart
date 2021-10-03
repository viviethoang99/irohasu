// import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

// import '../../env.dart';

// class WebViewPage extends StatefulWidget {
//   const WebViewPage({
//     Key? key,
//     required this.title,
//     required this.url,
//   }) : super(key: key);

//   static const routeName = '/webview';

//   final String? title;
//   final String url;

//   @override
//   _WebViewPageState createState() => _WebViewPageState();
// }

// class _WebViewPageState extends State<WebViewPage> {
//   String? title;
//   final flutterWebViewPlugin = FlutterWebviewPlugin();

//   @override
//   void initState() {
//     super.initState();
//     title = widget.title;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: WebviewScaffold(
//         appBar: AppBar(
//           title: Text(title!),
//           leading: IconButton(
//             icon: const Icon(Icons.close),
//             onPressed: () => Navigator.of(context).pop()
//           ),
//         ),
//         url: ENV.webPage + widget.url,
//         hidden: true,
//         withJavascript: true,
//       ),
//     );
//   }
// }
