import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersistCounter extends StatefulWidget {
  @override
  State<PersistCounter> createState() => _PersistCounterState();
}

class _PersistCounterState extends State<PersistCounter> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('count from shared preference: $_counter'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _incrementCounter, child: Icon(Icons.add)),
            SizedBox(width: 16),
            ElevatedButton(onPressed: _resetCounter, child: Icon(Icons.lock_reset)),
          ],
        ),
      ],
    ));
  }

  // NOTE: NSUserDefaultsの保存場所->https://qiita.com/dondoko-susumu/items/85f5e1449df94be20fa9
  Future<void> _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  Future<void> _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }

  Future<void> _resetCounter() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('counter');
    setState(() {
      _counter = 0;
    });
  }
}
