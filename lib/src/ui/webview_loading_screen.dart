import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewLoading extends StatefulWidget {
  @override
  _WebViewLoadingState createState() => _WebViewLoadingState();
}

class _WebViewLoadingState extends State<WebViewLoading> {
  final flutterWebviewPlugin = FlutterWebviewPlugin();
  StreamSubscription<WebViewStateChanged> _onStateChanged;

  List<String> elementRemove = [
    'document.getElementById("mbtfloat").remove();',
    'document.getElementById("qc_M_Home_4_Detail").remove();',
    'document.getElementById("qc_M_Home_8").remove();',
    'document.querySelectorAll("center").forEach(e => e.parentNode.removeChild(e));',
    'document.querySelectorAll("br").forEach(e => e.parentNode.removeChild(e));',
    'document.querySelectorAll("hr").forEach(e => e.parentNode.removeChild(e));',
    'document.querySelectorAll("footer").forEach(e => e.parentNode.removeChild(e));',
    'Array.from(document.getElementsByClassName("qc_M_Chap_Middle")).forEach(e => e.parentNode.removeChild(e));',
    'Array.from(document.getElementsByClassName("linkchapter")).forEach(e => e.parentNode.removeChild(e));',
    'Array.from(document.getElementsByClassName("bt-breadcrumb")).forEach(e => e.parentNode.removeChild(e));',
    'Array.from(document.getElementsByClassName("navbar-header")).forEach(e => e.parentNode.removeChild(e));',
    'Array.from(document.getElementsByClassName("navbar")).forEach(e => e.parentNode.removeChild(e));',
    // 'document.getElementsByClassName("container body-content")[0].classList.remove("body-content")';
    'document.getElementsByClassName("chapter-detail")[0].classList.remove("chapter-detail1");'
  ];

  void removeElementInChapter(String element) {
    flutterWebviewPlugin.evalJavascript(element);
  }

  @override
  void initState() {
    super.initState();
    _onStateChanged =
        flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      if (state.type == WebViewState.finishLoad) {
        elementRemove.forEach(removeElementInChapter);
      }
    });
  }

  @override
  void dispose() {
    _onStateChanged.cancel();
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const WebviewScaffold(
      url: 'https://m.blogtruyen.vn/c507384/shingeki-no-kyojin-chap-133',
      withZoom: true,
      hidden: true,
      scrollBar: true,
      // scrollBar: true,
    );
  }
}
