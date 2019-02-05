import 'package:flutter/material.dart';
import 'package:project_green/challenges/challenge.dart';
import 'package:project_green/challenges/challenge_mappings.dart';
import 'package:project_green/localization/app_localizations.dart';
import 'package:project_green/widgets/theme_values.dart';

class ChallengeCard extends StatelessWidget {
  final Challenge challenge;

  ChallengeCard(this.challenge);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: ThemeValues.boxShadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: Stack(
          children: <Widget>[
            Container(
              height: 100,
              color: ThemeValues.green,
            ),
            Positioned(
              left: 7, right: 0, top: 0, bottom: 0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(ChallengeMappings.emoji(challenge.type),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                  )
                ),
              ),
            ),
            Positioned(
              left: 80, right: 0, top: 5, bottom: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      AppLocalizations.of(context).avoidPrefix + " " + ChallengeMappings.name(challenge.type, context),
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                  Text("${AppLocalizations.of(context).currentStreak}: 30",
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                  Text("${AppLocalizations.of(context).longestStreak}: 30",
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ],
              ),
            ),
            Positioned(
              width: 130, right: -40, top: -20, bottom: -20,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ThemeValues.greenDark,
                  boxShadow: ThemeValues.boxShadow,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Icon(Icons.report,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
