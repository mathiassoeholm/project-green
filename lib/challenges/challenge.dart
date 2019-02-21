import 'package:built_value/built_value.dart';
import 'package:project_green/challenges/challenge_type.dart';
import 'package:uuid/uuid.dart';

part 'challenge.g.dart';

abstract class Challenge implements Built<Challenge, ChallengeBuilder> {
  String get key;

  ChallengeType get type;

  DateTime get start;

  Challenge._();
  factory Challenge([updates(ChallengeBuilder b)]) =>_$Challenge((b) => b
    // Default values:
    ..key = Uuid().v4()
    ..update(updates)
  );
}