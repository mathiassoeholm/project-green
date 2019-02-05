import 'package:built_value/built_value.dart';
import 'package:project_green/challenges/challenge_type.dart';

part 'challenge.g.dart';

abstract class Challenge implements Built<Challenge, ChallengeBuilder> {
  ChallengeType get type;

  Challenge._();
  factory Challenge([updates(ChallengeBuilder b)]) = _$Challenge;
}