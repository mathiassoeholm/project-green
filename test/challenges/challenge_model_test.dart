import 'package:flutter_test/flutter_test.dart';
import 'package:project_green/challenges/challenge.dart';
import 'package:project_green/challenges/challenge_type.dart';
main() {
  group('Challenge Model', () {
    test('should generate different keys', () {
      final challenge1 = Challenge((b) => b
        ..type = ChallengeType.beef
        ..start = DateTime(2018, 12, 24)
      );

      final challenge2 = Challenge((b) => b
        ..type = ChallengeType.beef
        ..start = DateTime(2018, 12, 24)
      );

      expect(challenge1.key, isNot(challenge2.key));
    });
  });
}