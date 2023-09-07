import 'package:http/http.dart' as http;

Future<http.Response> fetchPhotos(http.Client client) async {
  // 5000個の写真オブジェクトを取得する
  return client.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
}