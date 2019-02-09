import 'package:project_green/challenges/challenge_type.dart';

class ChallengeMappings {
  static String avatarPath(ChallengeType type) {
    return "assets/images/challenges/${_imageName(type)}_avatar.png";
  }

  static String coverPath(ChallengeType type) {
    return "assets/images/challenges/${_imageName(type)}_cover.png";
  }

  static String _imageName(ChallengeType type) {
    switch(type) {
      case ChallengeType.beef: return "cow";
      case ChallengeType.flying: return "airplane";
    }

    throw Exception("Did not implement image name for type: $type");
  }
}