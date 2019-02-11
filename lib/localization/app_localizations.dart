import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_green/challenges/challenge_type.dart';
import 'package:project_green/utility/enum_utility.dart';

part 'app_localizations_text.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get title {
    return _text[locale.languageCode]['title'];
  }

  String get newChallengeButton {
    return _text[locale.languageCode]['new_challenge_button'];
  }

  String get currentStreak {
    return _text[locale.languageCode]['current_streak'];
  }

  String get longestStreak {
    return _text[locale.languageCode]['longest_streak'];
  }

  String get yearSingular {
    return _text[locale.languageCode]['year_singular'];
  }

  String get yearPlural {
    return _text[locale.languageCode]['year_plural'];
  }

  String get daySingular {
    return _text[locale.languageCode]['day_singular'];
  }

  String get dayPlural {
    return _text[locale.languageCode]['day_plural'];
  }

  String get and {
    return _text[locale.languageCode]['and'];
  }

  // Challenges
  String getLongChallengeTitle(ChallengeType challengeType) {
    return _text[locale.languageCode]['challenge_${enumName(challengeType)}_long'];
  }

  String getMediumChallengeTitle(ChallengeType challengeType) {
    return _text[locale.languageCode]['challenge_${enumName(challengeType)}_medium'];
  }

  String getShortChallengeTitle(ChallengeType challengeType) {
    return _text[locale.languageCode]['challenge_${enumName(challengeType)}_short'];
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'da'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}