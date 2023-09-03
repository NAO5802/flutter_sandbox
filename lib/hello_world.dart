import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider：変更されないオブジェクトを公開
// 複数のプロバイダーを作成できる
final helloWorldProvider = Provider((ref){
 final repository = ref.watch(otherProvider);

 return '$repository!!!';
});

final otherProvider = Provider((ref) => 'Hello World');

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
