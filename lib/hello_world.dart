import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final helloWorldProvider = Provider((_) => 'Hello world!');

class MyHelloWorld extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);

    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Text(
          value,
        ),
      ),
    ));
  }
}
