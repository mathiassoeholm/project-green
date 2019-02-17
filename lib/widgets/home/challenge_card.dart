import 'package:flutter/material.dart';
import 'package:project_green/challenges/challenge.dart';
import 'package:project_green/challenges/challenge_mappings.dart';
import 'package:project_green/localization/app_localizations.dart';
import 'package:project_green/localization/date_formatting.dart';
import 'package:project_green/widgets/sorry_button.dart';
import 'package:project_green/widgets/theme_values.dart';

class ChallengeCard extends StatelessWidget {
  static const double sorryButtonWidth = 90.0;
  static const double sorryButtonPadding = 7.0;

  final Challenge challenge;
  final DateTime today;
  final VoidCallback onTapSorry;

  ChallengeCard(this.challenge, {
    this.today,
    this.onTapSorry,
  });

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    final challengeTitle = screenWidth < 370
        ? AppLocalizations.of(context).getShortChallengeTitle(challenge.type)
        : screenWidth < 500
        ? AppLocalizations.of(context).getMediumChallengeTitle(challenge.type)
        : AppLocalizations.of(context).getLongChallengeTitle(challenge.type);

    return Container(
      height: 74,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: ThemeValues.cardDropShadow,
        borderRadius: BorderRadius.circular(5.0)
      ),
      child: Stack(
        children: <Widget>[
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
                      challengeTitle,
                      style: Theme.of(context).textTheme.title,
                    ),
                    Container(
                      /// Spacing between texts
                      height: 6.0,
                    ),
                    Text(DateFormatting.getDurationString(AppLocalizations.of(context),
                        fromDate: challenge.start,
                        toDate: today,
                      ),
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
                child: SorryButton(
                  onTap: onTapSorry,
                ),
              ),
            ),
          )
        ]
      ),
    );
  }
}
