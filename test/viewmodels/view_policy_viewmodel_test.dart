import 'package:flutter_test/flutter_test.dart';
import 'package:digi_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ViewPolicyViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
