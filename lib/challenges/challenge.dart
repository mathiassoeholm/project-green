import 'package:built_value/built_value.dart';

part 'challenge.g.dart';

abstract class Challenge implements Built<Challenge, ChallengeBuilder> {
  String get emoji;

  Challenge._();
  factory Challenge([updates(ChallengeBuilder b)]) = _$Challenge;
}