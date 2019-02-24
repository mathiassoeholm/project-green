import 'package:flutter/material.dart';
import 'package:project_green/challenges/challenge.dart';
import 'package:project_green/challenges/challenge_mappings.dart';
import 'package:project_green/localization/app_localizations.dart';
import 'package:project_green/localization/date_formatting.dart';
import 'package:project_green/widgets/home/home_values.dart';
import 'package:project_green/widgets/home/sorry_button.dart';
import 'package:project_green/widgets/theme_values.dart';

class ChallengeCard extends StatefulWidget {
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
  ChallengeCardState createState() {
    return new ChallengeCardState();
  }
}

class ChallengeCardState extends State<ChallengeCard> {

  /// NEEEEXT STEPS:
  /// Why not add deleting state to Redux
  /// Add challenge id of the one being deleted to the state
  /// Create delete button widget, which is visible from Home screen if in crorrect stat.
  /// Maybe do it like that?
  bool isDeleting;

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    final challengeTitle = screenWidth < 370
        ? AppLocalizations.of(context).getShortChallengeTitle(widget.challenge.type)
        : screenWidth < 500
        ? AppLocalizations.of(context).getMediumChallengeTitle(widget.challenge.type)
        : AppLocalizations.of(context).getLongChallengeTitle(widget.challenge.type);

    return GestureDetector(
      onLongPress: () {
        print('looong');
        isDeleting = true;
      },
      child: Container(
        height: cardHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: ThemeValues.cardDropShadow,
          borderRadius: BorderRadius.circular(5.0)
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0, bottom: 0, top: 0, right: ChallengeCard.sorryButtonWidth + 2*ChallengeCard.sorryButtonPadding,
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
                                image: AssetImage(ChallengeMappings.avatarPath(widget.challenge.type)),
                                fit: BoxFit.cover,
                              ),
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
                          fromDate: widget.challenge.start,
                          toDate: widget.today,
                        ),
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0, width: ChallengeCard.sorryButtonWidth + 2*ChallengeCard.sorryButtonPadding, top: 0, bottom: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: ChallengeCard.sorryButtonPadding),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SorryButton(
                    onTap: widget.onTapSorry,
                  ),
                ),
              ),
            ),
            Positioned(
              left: -20, top: -20, width: 27, height: 27,
              child: IconButton(
                icon: Icon(Icons.cancel,
                  size: 27.0,
                ),
                onPressed: () {
                  print('Hey');
                },
              ),
            ),
          ]
        ),
      ),
    );
  }
}
