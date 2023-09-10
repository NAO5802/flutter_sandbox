import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


class PersistCounter2 extends StatefulWidget {
  const PersistCounter2({super.key, required this.storage});

  final CounterStorage storage;

  @override
  State<PersistCounter2> createState() => _PersistCounter2State();
}

class _PersistCounter2State extends State<PersistCounter2>{
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    widget.storage.loadCounter().then((value) => {
      setState((){
        _counter = value;
      })
     });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('count from file: $_counter'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _incrementCounter, child: Icon(Icons.add)),
                SizedBox(width: 16),
                // ElevatedButton(onPressed: _resetCounter, child: Icon(Icons.lock_reset)),
              ],
            ),
          ],
        ));
  }

  Future<File> _incrementCounter(){
    setState(() {
      _counter++;
    });
    return widget.storage.writeCounter(_counter);
  }
}

class CounterStorage {
  Future<File> get _localFile async {
    final path = await _localPath;
    print('path $path');
    return File('$path/counter.txt');
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<int> loadCounter() async {
    try {
      final file = await _localFile;

      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    return file.writeAsString('$counter');
  }
}