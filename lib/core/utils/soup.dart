import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:collection/collection.dart';

class DartSoup {
  DartSoup(String htmlDoc) : doc = parse(htmlDoc);

  final Document doc;

  Element? call(String selector) => doc.querySelector(selector);

  List<Element> findAll(String selector) {
    return doc.querySelectorAll(selector);
  }

  List<Element> findAllByClass(String className) {
    return doc.getElementsByClassName(className);
  }

  Element? searchListByAttr({
    required String id,
    required String attr,
    String? equal,
  }) {
    return findAll(id).firstWhereOrNull(
      (item) => item.attributes[attr] == equal,
    );
  }

  Element? findByText(List<Element> description, String text) {
    for (var index = 0; index < description.length; index++) {
      if (description[index].text.contains(text)) {
        return description[index];
      }
    }
    return null;
  }

  Map<String, String> countTotalLike(String? value) {
    final keyValuePairs = value?.split(';') ?? const [];
    final map = <String, String>{};
    for (var pair in keyValuePairs) {
      final entry = pair.split('=');
      map[entry[0].trim()] = entry[1].trim();
    }
    return map;
  }

  String listElementToString(List<Element>? element) {
    return element?.map((e) => e.text).toList().join(',') ?? '';
  }

  String? attr(Element? e, String attribute) => e?.attributes[attribute];
}
