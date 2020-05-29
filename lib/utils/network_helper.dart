import 'dart:convert';
import 'package:http/http.dart' as http;

class NetwrokHelper {
  String url;

  NetwrokHelper({this.url});

  Future<dynamic> makeRequest() async {
    print('make request called.');
    http.Response response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Error in making request with status code: ${response.statusCode}');
    }
  }
}
