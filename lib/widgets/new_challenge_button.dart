import 'package:flutter/material.dart';
import 'package:project_green/localization/app_localizations.dart';
import 'package:project_green/widgets/theme_values.dart';

class NewChallengeButton extends StatelessWidget {static
  const height = 70.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: ThemeValues.greenFaded,
          boxShadow: ThemeValues.boxShadow,
          borderRadius: BorderRadius.circular(height/2.0),
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 0, 2, 0),
              child: Icon(Icons.filter_vintage,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(2, 0, 6, 0),
              child: Text(AppLocalizations.of(context).newChallengeButton),
            ),
          ],
        ),
      ),
    );
  }
}
