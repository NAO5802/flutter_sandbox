import 'package:flutter/material.dart';
import 'package:flutter_sandbox/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  // flutter test で実行できる
  patrolTest("patrol custom finder", (PatrolTester $) async {
    await $.pumpWidgetAndSettle(const MyApp());

    await $(#like_button).tap();
    await $(#favorite_menu_icon).tap();

    expect($('No favorites yet').visible, equals(false));
  });

  testWidgets('flutter test', (widgetTester) async {
    await widgetTester.pumpWidget(const MyApp());

    await widgetTester.tap(find.byKey(Key('like_button')));
    await widgetTester.tap(find.byKey(Key('favorite_menu_icon')));

    expect(find.text("No favorites yet"), findsNothing);
  });

  patrolTest('mixed', (PatrolTester $) async{
    await $.pumpWidgetAndSettle(const MyApp());

    await $(#like_button).tap();

    final WidgetTester widgetTester = $.tester;
    await widgetTester.tap(find.byKey(Key('favorite_menu_icon')));

    expect($('No favorites yet').visible, equals(false));
  });

}
