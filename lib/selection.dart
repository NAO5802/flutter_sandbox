import 'package:flutter/material.dart';

class MySelectionScreen extends StatelessWidget {
  const MySelectionScreen({super.key});

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

  if(!context.mounted) return;

  ScaffoldMessenger.of(context)
   ..removeCurrentSnackBar()
   ..showSnackBar(SnackBar(content: Text('$result')));

}

class SelectionScreen extends StatelessWidget{
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'yes!');
              },
              child: const Text('yes!'),
            )
          ),
          Padding(
              padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'no');
              },
              child: const Text('no'),
            )
          ),
        ],
      ),
    );
  }

}