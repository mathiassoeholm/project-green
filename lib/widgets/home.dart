import 'package:flutter/material.dart';
import 'package:project_green/localization/app_localizations.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(AppLocalizations.of(context).title),
    );
  }
}
