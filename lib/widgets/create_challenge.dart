import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:project_green/challenges/challenge_type.dart';
import 'package:project_green/localization/app_localizations.dart';
import 'package:project_green/widgets/challenge_carousel.dart';
import 'package:project_green/widgets/green_button.dart';
import 'package:project_green/widgets/status_bar_gradient.dart';
import 'package:project_green/widgets/theme_values.dart';

class CreateChallenge extends StatefulWidget {
  final VoidCallback close;

  const CreateChallenge({
    @required this.close,
  });

  @override
  CreateChallengeState createState() {
    return new CreateChallengeState();
  }
}

class CreateChallengeState extends State<CreateChallenge> {
  ChallengeType selectedChallenge = allChallengeTypes[ChallengeCarousel.firstPageIndex % allChallengeTypes.length];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ThemeValues.lightBackground,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          StatusBarGradient(),
          ChallengeCarousel(
            onSelectType: (type) {
              setState(() {
                selectedChallenge = type;
              });
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
              child: Center(
                child: AutoSizeText(AppLocalizations.of(context).getDescription(selectedChallenge),
                  style: Theme.of(context).textTheme.body1,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 43.0),
            child: GreenButton(
              onTap: widget.close,
              text: 'LET’S DO IT!',
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: GestureDetector(
                onTap: widget.close,
                child: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: Color(0xFFC4C4C4),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Icon(Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 42,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
