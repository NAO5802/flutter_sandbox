import 'package:flutter/material.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: _CartList(),
                )
            ),
            const Divider(height: 4, color: Colors.black,),
            _CartTotal()
          ],
        ),
      ),
    );
  }
  
}

class _CartTotal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _CartList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}