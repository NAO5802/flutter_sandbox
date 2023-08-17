import 'package:flutter/material.dart';
import 'package:flutter_sandbox/main.dart';

class MyNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: MaterialButton(
          onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => GeneratorPage())
            );
          },
          child: Text('click here'),
        ),
      );
  }
}
