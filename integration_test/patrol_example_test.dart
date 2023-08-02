import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  // ネイティブ自動化機能を使用するためにpatrol testで実行
  patrolTest(
      'change dark mode',
      nativeAutomation: true,
          ($) async {

        await $.pumpWidgetAndSettle(MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.system,
          home: Scaffold(
            appBar: AppBar(title: const Text("app"))
          ),
        ));

        expect($("app"), findsOneWidget);
        await $.pump(Duration(seconds: 3));

        await $.native.pressHome();
        await $.native.enableDarkMode();
        await $.native.openApp();

        expect($("app"), findsOneWidget);
      });
}
