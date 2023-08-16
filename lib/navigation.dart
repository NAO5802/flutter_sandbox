import 'package:flutter/material.dart';

class MyNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: MaterialButton(
          onPressed: (){
            print('aaa');
          },
          child: Text('click here'),
        ),
      );
  }
}
