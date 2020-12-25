import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:irohasu/src/constants/base_blogtruyen.dart';
import 'package:http/http.dart' as http;

class TestData extends StatelessWidget {
  void getInfoManga() async {
    final client = http.Client();
    http.Response response = await client.get(
        "https://blogtruyen.vn/14979/comigairu",
        headers: BlogTruyen.headersBuilder);
    if (response.statusCode == 200) {
      final document = parse(response.body);
      final List<dom.Element> description =
          document.querySelectorAll('div.description > p');
      final List getAuthor = findElement(description, "Tác giả").querySelectorAll("a");
      final List<String> author = getElementAuthor(getAuthor);
      print(author);
    } else {
      print("Something get wrong! Status code ${response.statusCode}");
    }
  }

  dom.Element findElement(List<dom.Element> description, String text) {
    for (var index = 0; index < description.length; index++) {
      if (description[index].text.contains(text)) {
        return description[index];
      }
    }
    return null;
  }

  List<String> getElementAuthor(List<dom.Element> element) {
    final List<String> author = [];
    for(var i = 0; i < element.length; i++) {
      author.add(element[i].text);
    }
    return author;
  }

  Map<String, String> countTotalLike(String value) {
    List<String> keyValuePairs = value.split(";");
    final Map<String, String> map = {};

    for (String pair in keyValuePairs) {
      List<String> entry = pair.split("=");
      map['${entry[0].trim()}'] = entry[1].trim();
    }
    return map;
  }


  // Map<String, int> findCountLike(dom.Element document){
  //   Map<String, int> countLike;
  //   final like = document.getElementsByClassName('total-vote')[0].attributes;
  //   for (var index = 0; index < like.length; index++) {
  //     switch (like[index]) {
  //       case
  //     }
  //   }
  // }

  Map<String, String> getDescription(dom.Element description) {
    final Map<String, String> getData = {
      "author": null,
      "teamTranslator": null,
      "status": null,
      "view": null,
      "follow": null,
      "update": null,
    };

    // List elementDescription = description.documentElement.contains(node);

    // elementDescription.forEach((element) {
    //   switch (element.in) {
    //
    //   }
    // });

    return getData;
  }

  @override
  Widget build(BuildContext context) {
    getInfoManga();
    return Container();
  }
}
