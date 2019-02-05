import 'package:flutter/material.dart';
import 'package:project_green/challenges/challenge_type.dart';
import 'package:project_green/localization/app_localizations.dart';

class ChallengeMappings {
  static String emoji(ChallengeType type) {
    switch(type) {
      case ChallengeType.beef: return "🐄";
      case ChallengeType.flying: return "🛫";
    }

    throw Exception("Did not implement emoji for type: $type");
  }

  static String name(ChallengeType type, BuildContext context) {
    switch(type) {
      case ChallengeType.beef: return AppLocalizations.of(context).challengeBeef;
      case ChallengeType.flying: return AppLocalizations.of(context).challengeFlying;
    }

    throw Exception("Did not implement name for type: $type");
  }
}