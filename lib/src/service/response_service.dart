import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

class ResponseService {
  static http.Client client = http.Client();

  static Future<dynamic> getResponse(url) async {
    http.Response response = await client.get(url);

    if (response.statusCode == 200) {
      final document = parse(response.body);
      return document;
    } else {
      print("Something get wrong! Status code ${response.statusCode}");
    }
  }
}
