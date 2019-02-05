import 'package:flutter_test/flutter_test.dart';
import 'package:project_green/challenges/challenge_mappings.dart';
import 'package:project_green/challenges/challenge_type.dart';

main() {
  group('Challenge Mappings', () {
    test('should return emoji for challenge type', () {
      expect(ChallengeMappings.emoji(ChallengeType.beef), "🐄");
    });
  });
}