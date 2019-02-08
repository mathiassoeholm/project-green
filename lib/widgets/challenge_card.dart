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
        boxShadow: ThemeValues.cardDropShadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Stack(
          children: <Widget>[
            Container(
              height: 74,
              color: Colors.white,
            ),
            Positioned(
              left: 7, right: 0, top: 0, bottom: 0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(ChallengeMappings.avatarPath(challenge.type)),
                )
              ),
            ),
            Positioned(
              left: 80, right: 0, top: 16, bottom: 16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context).avoidPrefix + " " + ChallengeMappings.name(challenge.type, context),
                    style: Theme.of(context).textTheme.title,
                  ),
                  Text("${AppLocalizations.of(context).currentStreak}: 30",
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0, right: 7, top: 0, bottom: 0,
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: ThemeValues.green,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: ThemeValues.buttonDropShadow,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("SORRY",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: Icon(Icons.public,
                            color: Colors.white,
                            size: 22,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
