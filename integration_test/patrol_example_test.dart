import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  // ネイティブ自動化機能を使用するためにpatrol testで実行
  patrolTest(
      'count state is the same after going home and switching apps',
      nativeAutomation: true,
      ($) async {

        await $.pumpWidgetAndSettle(MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: const Text("app"),),
            backgroundColor: Colors.blue,
          ),
        ));

        expect($("app"), findsOneWidget);
        await $.native.pressHome();
      });
}
