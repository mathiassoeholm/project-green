import 'package:flutter/material.dart';
import 'package:project_green/challenges/challenge.dart';
import 'package:project_green/challenges/challenge_mappings.dart';
import 'package:project_green/localization/app_localizations.dart';
import 'package:project_green/localization/date_formatting.dart';
import 'package:project_green/widgets/home/home_values.dart';
import 'package:project_green/widgets/challenge_card/sorry_button.dart';
import 'package:project_green/widgets/points_display.dart';
import 'package:project_green/widgets/theme_values.dart';
import 'package:project_green/widgets/widget_lib/conditional.dart';

class ChallengeCard extends StatefulWidget {
  static const double sorryButtonWidth = 90.0;
  static const double sorryButtonPadding = 7.0;

  final Challenge challenge;
  final DateTime today;
  final VoidCallback onTapSorry;
  final VoidCallback onLongPress;
  final VoidCallback onDeleted;
  final bool isInDeleteMode;

  ChallengeCard(this.challenge, {
    @required this.today,
    @required this.onTapSorry,
    @required this.onLongPress,
    @required this.onDeleted,
    @required this.isInDeleteMode,
  }) : super(key: ObjectKey(challenge.key));

  @override
  _ChallengeCardState createState() {
    return new _ChallengeCardState();
  }
}

class _ChallengeCardState extends State<ChallengeCard> with SingleTickerProviderStateMixin  {
  AnimationController resizeController;
  Animation<double> resizeAnimation;

  @override
  void initState() {
    super.initState();

    resizeController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    resizeAnimation = CurvedAnimation(
      parent: resizeController,
      curve: Curves.ease
    )
    .drive(Tween(begin: 1.0, end: 0.0))
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onDeleted();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final challengeTitle = screenWidth < 370
        ? AppLocalizations.of(context).getShortChallengeTitle(widget.challenge.type)
        : screenWidth < 500
        ? AppLocalizations.of(context).getMediumChallengeTitle(widget.challenge.type)
        : AppLocalizations.of(context).getLongChallengeTitle(widget.challenge.type);

    return AnimatedBuilder(
      animation: resizeController,
      builder: (context, child) {
        if (resizeController.status == AnimationStatus.forward) {
          return Container(
            height: (cardHeight+2*verticalCardPadding)*resizeAnimation.value,
            width: double.infinity,
          );
        } else {
          return child;
        }
      },
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(horizontalCardPadding, verticalCardPadding, horizontalCardPadding, verticalCardPadding),
            child: GestureDetector(
              onLongPress: widget.onLongPress,
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
                  ]
                ),
              ),
            ),
          ),
          Positioned(
            left: horizontalCardPadding + 8, right: 0, top: 0, bottom: 0,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: PointsDisplay(
                totalPoints: ChallengeMappings.getDailyPoints(widget.challenge,
                  currentDate: widget.today,
                ),
              ),
            )
          ),
          Conditional(
            predicate: () => widget.isInDeleteMode,
            child: Positioned.fill(
              child: Align(
                alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.cancel,
                      size: 27,
                    ),
                    onPressed: resizeController.forward,
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    resizeController.dispose();
    super.dispose();
  }
}
