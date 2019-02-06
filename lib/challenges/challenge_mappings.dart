import 'package:flutter/material.dart';
import 'package:project_green/challenges/challenge_type.dart';
import 'package:project_green/localization/app_localizations.dart';

class ChallengeMappings {
  static String imagePath(ChallengeType type) {
    return "assets/emoji/${_imageName(type)}.png";
  }

  static String _imageName(ChallengeType type) {
    switch(type) {
      case ChallengeType.beef: return "cow";
      case ChallengeType.flying: return "airplane";
    }

    throw Exception("Did not implement image name for type: $type");
  }

  static String name(ChallengeType type, BuildContext context) {
    switch(type) {
      case ChallengeType.beef: return AppLocalizations.of(context).challengeBeef;
      case ChallengeType.flying: return AppLocalizations.of(context).challengeFlying;
    }

    throw Exception("Did not implement name for type: $type");
  }
}