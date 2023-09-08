import 'package:flutter/material.dart';
import 'package:flutter_sandbox/fetch_photos.dart';

import 'package:http/http.dart' as http;

class MyPhoto extends StatefulWidget {
  const MyPhoto({super.key});

  @override
  State<StatefulWidget> createState() => _MyPhotoState();
}

class _MyPhotoState extends State<MyPhoto> {
  late Future<List<Photo>> futurePhotos;
  final client = http.Client();

  @override
  void initState() {
    super.initState();
    futurePhotos = fetchPhotos(client);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: FutureBuilder<List<Photo>>(
              future: futurePhotos,
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return Text(snapshot.data!.first.title);
                }else if(snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // default
                return const CircularProgressIndicator();
              },
            ),
          ),
          Text('Large photos')
        ],
      ),
    );
  }
}
