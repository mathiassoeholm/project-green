import 'package:flutter/material.dart';
import 'package:project_green/localization/app_localizations.dart';
import 'package:project_green/widgets/theme_values.dart';

class NewChallengeButton extends StatelessWidget {static
  const height = 60.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height,
        decoration: BoxDecoration(
          boxShadow: ThemeValues.boxShadow,
          borderRadius: BorderRadius.circular(height/2.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(height/2.0),
          child: Material(
            color: Colors.black,
            child: InkWell(
              onTap: () { },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 2, 0),
                    child: Text(AppLocalizations.of(context).newChallengeButton),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(2, 0, 8, 0),
                      child: Text("💪",
                        style: TextStyle(
                            fontSize: 24
                        ),
                      )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
