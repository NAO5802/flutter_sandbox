import 'package:flutter_sandbox/my_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main () {
  // flutter test で実行できる
  patrolTest('counter is increment when plus button taped',
          (PatrolTester $) async {
            await $.pumpWidget(const MyWidget(title: 'T', message: 'M'));

            expect($('T'), findsOneWidget);
            expect($('M'), findsOneWidget);
          });
}