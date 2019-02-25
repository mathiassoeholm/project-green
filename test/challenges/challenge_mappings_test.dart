import 'package:flutter_test/flutter_test.dart';
import 'package:project_green/challenges/challenge.dart';
import 'package:project_green/challenges/challenge_type.dart';
import 'package:project_green/challenges/challenge_mappings.dart';
import 'package:built_collection/built_collection.dart';

main() {
  group('Challenge Mappings', () {
    test('getDailyPoints', () {
      final challenge = Challenge((b) => b
        ..type = ChallengeType.beef
        ..start = DateTime(2019, 1, 1)
        ..relapses = BuiltList<DateTime>([
          DateTime(2019, 1, 2)
        ]).toBuilder()
      );

      expect(ChallengeMappings.getDailyPoints(challenge,
        currentDate: DateTime(2019, 1, 2)
      ), 1);

      expect(ChallengeMappings.getDailyPoints(challenge,
        currentDate: DateTime(2019, 1, 3)
      ), 2);

      expect(ChallengeMappings.getDailyPoints(challenge,
        currentDate: DateTime(2019, 1, 4)
      ), 3);

      // Cap number of points
      expect(ChallengeMappings.getDailyPoints(challenge,
        currentDate: DateTime(2019, 1, 30)
      ), 20);
    });

    test('getDailyPoints, no relapses', () {
      final challenge = Challenge((b) => b
        ..type = ChallengeType.beef
        ..start = DateTime(2019, 1, 1)
      );

      expect(ChallengeMappings.getDailyPoints(challenge,
        currentDate: DateTime(2019, 1, 1)
      ), 1);

      expect(ChallengeMappings.getDailyPoints(challenge,
        currentDate: DateTime(2019, 1, 2)
      ), 2);

      expect(ChallengeMappings.getDailyPoints(challenge,
        currentDate: DateTime(2019, 1, 3)
      ), 3);

      // Cap number of points
      expect(ChallengeMappings.getDailyPoints(challenge,
        currentDate: DateTime(2019, 1, 30)
      ), 20);
    });

    test('getDailyPoints, current date before start', () {
      final challenge = Challenge((b) => b
        ..type = ChallengeType.beef
        ..start = DateTime(2019, 1, 10)
      );

      expect(ChallengeMappings.getDailyPoints(challenge,
        currentDate: DateTime(2019, 1, 1)
      ), 1);
    });
  });
}