import 'package:flutter/material.dart';

class MyNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: MaterialButton(
          onPressed: (){
            // Navigator.of(context).push(
            //     MaterialPageRoute(builder: (context) => GeneratorPage())
            // );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
          child: Text('click here'),
        ),
      );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }

}