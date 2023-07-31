import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sandbox/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('E2E test', () {
    testWidgets('tap like, verify add to favorite', (widgetTester) async {
      // given
      await widgetTester.pumpWidget(MyApp());

      // when
      final likeButton = find.byKey(Key('like_button'));
      await widgetTester.tap(likeButton);

      // final favoriteMenu = find.byIcon(Icons.favorite);
      final favoriteMenu = find.byKey(Key('favorite_menu_icon'));
      await widgetTester.tap(favoriteMenu);

      // then
      expect(find.text("No favorites yet"), findsNothing);
    });
  });
}