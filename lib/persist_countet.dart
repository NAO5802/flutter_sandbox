import 'package:flutter/cupertino.dart';

class PersistCounter extends StatefulWidget {
  @override
  State<PersistCounter> createState() => _PersistCounterState();
}

class _PersistCounterState extends State<PersistCounter> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('count: $_counter'));
  }
}
