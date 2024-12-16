import 'package:flutter_test/flutter_test.dart';
import 'package:rentafriend/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('AppRootViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
