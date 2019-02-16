import 'package:flutter_test/flutter_test.dart';
import 'package:project_green/utility/number_utility.dart';

main() {
  group('Number Utility', () {
    test('set01RangeThreshold', () {
      expect(set01RangeThreshold(0.1, threshold: 0.3), 0);
      expect(set01RangeThreshold(1.0, threshold: 1.0), 0);
      expect(approxEqual(set01RangeThreshold(1.0, threshold: 0.96), 1.0), true);
      expect(approxEqual(set01RangeThreshold(0.6, threshold: 0.2), 0.5), true);
    });

    test('approxEqual', () {
      expect(approxEqual(0.1, 0.1), true);
      expect(approxEqual(0.1, 2.0), false);
      expect(approxEqual(0.5, 0.499999999), true);
    });
  });
}