import 'package:flutter_sandbox/main.dart';
import 'package:flutter_sandbox/my_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  // flutter test で実行できる
  patrolTest('counter is increment when plus button taped',
      config: PatrolTesterConfig(visibleTimeout:  Duration(seconds: 10)),
      (PatrolTester $) async {
    await $.pumpWidget(const MyWidget(title: 'T', message: 'M'));

    expect($('T'), findsOneWidget);
    expect($('M'), findsOneWidget);
  });

  patrolTest("tap like", (PatrolTester $) async {
    await $.pumpWidgetAndSettle(const MyApp());

    await $(#like_button).tap();
    await $(#favorite_menu_icon).tap();

    // expect($('No favorites yet'), findsNothing); //  表示したか？ではなくウィジェットツリーに存在するか？をみてる
    expect($('No favorites yet').visible, equals(false));
  });
}
