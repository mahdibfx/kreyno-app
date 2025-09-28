import 'package:flutter_test/flutter_test.dart';
import 'package:kreyno/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ReservationsServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
