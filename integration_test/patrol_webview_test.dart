import 'package:flutter_sandbox/main.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolTest("show webview and tap Get started", nativeAutomation: true, (PatrolTester $) async {
    await $.pumpWidgetAndSettle(const MyApp());

    await $(#webview_menu_icon).tap();
    // await $.native.tap(Selector(text: "Get started"));
    //
    // expect($('macOS').visible, equals(true));
  });
}
