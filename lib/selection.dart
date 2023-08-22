import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SelectionButton(),
    );
  }
}

class SelectionButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SelectionButtonState();
  }
}

class _SelectionButtonState extends State<SelectionButton>{
  @override
  Widget build(BuildContext context) {
  return ElevatedButton(
      onPressed: () {
        _navigationAndDisplaySelection(context);
      },
      child: const Text('Pick an option!')
  );
  }
}

Future<void> _navigationAndDisplaySelection(BuildContext context) async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SelectionScreen())
  );
}
