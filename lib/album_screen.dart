import 'package:flutter/material.dart';

import 'fetch_album.dart';
import 'package:http/http.dart' as http;

class MyAlbum extends StatefulWidget {
  const MyAlbum({super.key});

  @override
  State<StatefulWidget> createState() => _MyAlbumState();
}

class _MyAlbumState extends State<MyAlbum> {
  late Future<Album> futureAlbum;
  final client = http.Client();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum(client);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: FutureBuilder<Album>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return Text(snapshot.data!.title);
                }else if(snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // default
                return const CircularProgressIndicator();
              },
            ),
          ),
          TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: 'Enter title'),
          ),
          ElevatedButton(
              onPressed: (){
                setState(() {
                  futureAlbum = updateAlbum(_controller.text);
                });
              },
              child: const Text('Update Data')
          )
        ],
      ),
    );
  }
}
