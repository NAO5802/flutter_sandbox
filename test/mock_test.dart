import 'package:flutter_sandbox/fetch_album.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'mock_test.mocks.dart';

// flutter pub run build_runner build でmock生成
@GenerateMocks([http.Client])
void main() {
  group("fetchAlbum", () {
    test('return an Album if the http call completes successfully', () async {
      final client = MockClient();
      when(client.get(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async =>
          http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

      final actual = await fetchAlbum(client);

      expect(actual, isA<Album>());
    });

    test('throws an exception if the http call completes with an error', () async {
      final client = MockClient();
      when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
      .thenAnswer((_) async => http.Response('Not found', 404));
      
      final actual = fetchAlbum(client);
      
      expect(actual, throwsException);
  });
});
}


