import 'package:flutter/material.dart';

class TextExample extends StatelessWidget {
  static final bold24Roboto = TextStyle(
    fontFamily: "Georgia",
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  final childContainer = Center(
    child: Container(
      width: 240,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red[400],
      ),
      child: Text(
        'hello world',
        style: bold24Roboto,
        textAlign: TextAlign.center,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 320,
        height: 240,
        // color: Colors.grey[300],
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        child: Stack(children: [Positioned(
            left: 24,
            top: 24,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red[400]
              ),
              child: Text(
                'hello red container',
                style: bold24Roboto,
              )
            )
        )
        ]));
  }
}
