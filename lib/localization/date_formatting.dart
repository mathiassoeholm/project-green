import 'package:project_green/localization/app_localizations.dart';

class DateFormatting {
  static String getDurationString(AppLocalizations appLocalizations, {
    DateTime fromDate,
    DateTime toDate})
  {
    final difference = toDate.difference(fromDate);
    final daysDifference = difference.inDays + 1; // Start duration at 1
    final years = (daysDifference/365).floor();
    final days = daysDifference - years*365;

    var buffer = StringBuffer();

    if (years > 0) {
      buffer.write(years);
      buffer.write(" ");
      buffer.write(years == 1 ? appLocalizations.yearSingular : appLocalizations.yearPlural);

      if (days > 0) {
        buffer.write(" ");
        buffer.write(appLocalizations.and);
        buffer.write(" ");
      }
    }

    if (days > 0) {
      buffer.write(days);
      buffer.write(" ");
      buffer.write(days == 1 ? appLocalizations.daySingular : appLocalizations.dayPlural);
    }

    return buffer.toString();
  }
}
