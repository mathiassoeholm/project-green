import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

  String get avoidPrefix {
    return _text[locale.languageCode]['avoid_prefix'];
  }

  String get challengeBeef {
    return _text[locale.languageCode]['challenge_beef'];
  }

  String get challengeFlying {
    return _text[locale.languageCode]['challenge_flying'];
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