import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  String url;

  NetworkHelper({this.url});

  Future<dynamic> makeRequest() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      print('GET request successful');
      return jsonDecode(response.body);
    } else {
      print('Error in making request with status code: ${response.statusCode}');
    }
  }
}
