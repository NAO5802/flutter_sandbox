import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<Album> fetchAlbum(http.Client client) async {
  final response = await client
      .get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1"),
      headers: {
        HttpHeaders.authorizationHeader: 'Basic your_api_token_here'
      });

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('failed to load album');
  }
}

Future<Album> createAlbum(String title) async{
  final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String> {
        'title': title
      })
  );

  if(response.statusCode == 201) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album');
  }
}

class Album {
  final int id;
  final String title;

  const Album({required this.id, required this.title});

  static Album fromJson(Map<String, dynamic> json) {
    return Album(
        id: json['id'],
        title: json['title']
    );
  }
}
