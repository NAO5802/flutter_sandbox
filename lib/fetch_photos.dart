import 'package:http/http.dart' as http;

Future<http.Response> fetchPhotos(http.Client client) async {
  // 5000個の写真オブジェクトを取得する
  return client.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
}

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}
