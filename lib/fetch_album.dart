import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Album> fetchAlbum(http.Client client) async {
  final response = await client
      .get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1"));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('failed to load album');
  }
}

class Album {
  static Album fromJson(List<dynamic> jsonList) {
    // NOTE: 仮の実装
    return Album();
  }
}
