import 'package:flutter/material.dart';
import 'package:project_green/localization/app_localizations.dart';

class CreateChallenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(AppLocalizations.of(context).avoidPrefix,
          style: Theme.of(context).textTheme.title,
        )
      ],
    );
  }
}
