import 'package:flutter/material.dart';
import 'package:project_green/challenges/challenge.dart';
import 'package:project_green/challenges/challenge_mappings.dart';
import 'package:project_green/localization/app_localizations.dart';
import 'package:project_green/utility/string_utility.dart';
import 'package:project_green/widgets/theme_values.dart';

class ChallengeCard extends StatelessWidget {
  static const double sorryButtonWidth = 90.0;
  static const double sorryButtonPadding = 7.0;

  final Challenge challenge;

  ChallengeCard(this.challenge);

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final avoid = AppLocalizations.of(context).avoidPrefix;
    final typeName = ChallengeMappings.name(challenge.type, context);

    final avoidText = screenWidth < 400
        ? capitalize(typeName)
        : avoid + " " + typeName;

    print(MediaQuery.of(context).size.width);
    return Container(
      height: 74,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: ThemeValues.cardDropShadow,
        borderRadius: BorderRadius.circular(5.0)
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0, bottom: 0, top: 0, right: sorryButtonWidth + 2*sorryButtonPadding,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(7.0),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(ChallengeMappings.avatarPath(challenge.type)),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      avoidText,
                      style: Theme.of(context).textTheme.title,
                    ),
                    Container(
                      /// Spacing between texts
                      height: 6.0,
                    ),
                    Text("30 dage",
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 0, width: sorryButtonWidth + 2*sorryButtonPadding, top: 0, bottom: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: sorryButtonPadding),
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
            ),
          )
        ]
      ),
    );
  }
}
