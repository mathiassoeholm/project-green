import 'package:flutter_test/flutter_test.dart';
import 'package:project_green/utility/number_utility.dart';

main() {
  group('Number Utility', () {
    test('mapFromRange', () {
      expect(
        mapFromRange(0.3, srcRange: [0.3, 0.7], destRange: [0.0, 1.0]),
        0.0,
      );

      expect(approxEqual(mapFromRange(0.7, srcRange: [0.3, 0.7], destRange: [0.0, 1.0]), 1.0),
        true,
      );

      expect(mapFromRange(-0.7, srcRange: [0.3, 0.7], destRange: [0.5, 1.2]),
        0.5,
      );

      expect(mapFromRange(100, srcRange: [0.3, 0.7], destRange: [0.5, 1.2]),
        1.2,
      );

      expect(mapFromRange(0.5, srcRange: [0.0, 1.0], destRange: [-1.0, 1.0]),
        0.0,
      );

      expect(mapFromRange(-1.5, srcRange: [-2.0, -1.0], destRange: [0.0, 1.0]),
        0.5,
      );
    });

    test('approxEqual', () {
      expect(approxEqual(0.1, 0.1), true);
      expect(approxEqual(0.1, 2.0), false);
      expect(approxEqual(0.5, 0.499999999), true);
    });
  });
}