import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_green/localization/app_localizations.dart';
import 'package:project_green/localization/date_formatting.dart';

void main() {
  group('Date Formatting', () {
    test('duration strings danish', () {
      final appLocalizations = AppLocalizations(Locale('da', 'DK'));

      expect(DateFormatting.getDurationString(appLocalizations,
          fromDate: DateTime(2014, 12, 24),
          toDate: DateTime(2015, 12, 23)
      ), '1 år');

      expect(DateFormatting.getDurationString(appLocalizations,
          fromDate: DateTime(2014, 12, 25),
          toDate: DateTime(2015, 12, 23)
      ), '364 dage');

      expect(DateFormatting.getDurationString(appLocalizations,
          fromDate: DateTime(2015, 7, 20),
          toDate: DateTime(2015, 7, 20)
      ), '1 dag');

      expect(DateFormatting.getDurationString(appLocalizations,
          fromDate: DateTime(2015, 7, 20),
          toDate: DateTime(2015, 7, 26)
      ), '7 dage');

      expect(DateFormatting.getDurationString(appLocalizations,
          fromDate: DateTime(2017, 7, 27),
          toDate: DateTime(2019, 11, 11)
      ), '2 år og 108 dage');
    });

    test('duration strings english', () {
      final appLocalizations = AppLocalizations(Locale('en', 'US'));

      expect(DateFormatting.getDurationString(appLocalizations,
          fromDate: DateTime(2014, 12, 24),
          toDate: DateTime(2015, 12, 23)
      ), '1 year');

      expect(DateFormatting.getDurationString(appLocalizations,
          fromDate: DateTime(2014, 12, 25),
          toDate: DateTime(2015, 12, 23)
      ), '364 days');

      expect(DateFormatting.getDurationString(appLocalizations,
          fromDate: DateTime(2015, 7, 20),
          toDate: DateTime(2015, 7, 20)
      ), '1 day');

      expect(DateFormatting.getDurationString(appLocalizations,
          fromDate: DateTime(2015, 7, 20),
          toDate: DateTime(2015, 7, 26)
      ), '7 days');

      expect(DateFormatting.getDurationString(appLocalizations,
          fromDate: DateTime(2017, 7, 27),
          toDate: DateTime(2019, 11, 11)
      ), '2 years and 108 days');
    });
  });
}