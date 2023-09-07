import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'fetch_album.g.dart';

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

Future<Album> updateAlbum(String title) async{
  final response = await http.put(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
      body: jsonEncode(<String, String>{
        'title': title
      })
  );

  if(response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to update album');
  }
}

@JsonSerializable()
class Album {
  Album(this.id, this.title);

  @JsonKey(required: true)
  final int id;
  @JsonKey(required: true, defaultValue: 'default title')
  final String title;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
