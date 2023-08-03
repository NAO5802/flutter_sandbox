import 'package:flutter_sandbox/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  // ネイティブ自動化機能を使用するためにpatrol testで実行
  patrolTest('back home and open app', nativeAutomation: true, ($) async {
    await $.pumpWidgetAndSettle(const MyApp());

    expect($("Like"), findsOneWidget);

    await $.native.pressHome();
    await $.native.openApp();

    expect($("Like"), findsOneWidget);
  });
}
