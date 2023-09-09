import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';


class PersistCounter2 extends StatefulWidget {
  @override
  State<PersistCounter2> createState() => _PersistCounter2State();
}

class _PersistCounter2State extends State<PersistCounter2>{
  int _counter = 0;

  Future<File> get _localFile async {
    final path = await _localPath;
    print('path $path');
    return File('$path/counter.txt');
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  @override
  void initState() {
    super.initState();
    _loadCounter().then((value) => {
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
                // ElevatedButton(onPressed: _incrementCounter, child: Icon(Icons.add)),
                SizedBox(width: 16),
                // ElevatedButton(onPressed: _resetCounter, child: Icon(Icons.lock_reset)),
              ],
            ),
          ],
        ));
  }

  Future<int> _loadCounter() async {
    try {
      final file = await _localFile;

      return 1;
    } catch (e) {
      return 0;
    }
  }
}