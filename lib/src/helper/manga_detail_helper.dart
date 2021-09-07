import 'package:html/dom.dart';

class MangaDetailHelper {
  static Element? findElement(List<Element> description, String text) {
    for (var index = 0; index < description.length; index++) {
      if (description[index].text.contains(text)) {
        return description[index];
      }
    }
  }

  static Map<String, String> countTotalLike(String? value) {
    var keyValuePairs = value?.split(';') ?? const [];
    final map = <String, String>{};
    for (var pair in keyValuePairs) {
      final entry = pair.split('=');
      map['${entry[0].trim()}'] = entry[1].trim();
    }
    return map;
  }

  static String? getElement(List<Element>? element) {
    final author = element?.map((e) => e.text).toList().join(',');
    return author;
  }
}
