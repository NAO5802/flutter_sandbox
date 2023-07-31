import 'package:flutter_sandbox/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter', () {
    test('value shoud start at 0', () {
      final counter = Counter();
      expect(counter.value, 0);
    });

    test('counter value should be increment', () {
      final counter = Counter();
      counter.increment();
      expect(counter.value, 1);
    });
  });
}
