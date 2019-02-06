import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_green/challenges/challenge_mappings.dart';
import 'package:project_green/challenges/challenge_type.dart';
import 'package:project_green/localization/app_localizations.dart';
import 'package:project_green/widgets/primary_action_button.dart';

class CreateChallenge extends StatelessWidget {
  static const _itemExtent = 33.0;

  @override
  Widget build(BuildContext context) {
    final safeAreaBottom = MediaQuery.of(context).padding.bottom;
    final addButtonPadding = max(safeAreaBottom, 10.0);

    return Material(
      color: Colors.green,
      child: Column(
        children: <Widget>[
          SafeArea(
            bottom: false, left: false, right: false,
            child: Container(
              padding: EdgeInsets.only(top: 40.0),
              width: double.infinity,
              height: 50,
              child: Align(
                alignment: Alignment.center,
                child: Text("Let's save 🌍",
                  style: Theme.of(context).textTheme.headline,
                )
              ),
            ),
          ),
          Expanded(
            child: Container(
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(AppLocalizations.of(context).avoidPrefix + ": ",
                style: Theme.of(context).textTheme.title,
              ),
              Container(
                padding: EdgeInsets.only(left: 3),
                height: 80,
                width: 200,
                child: ListWheelScrollView.useDelegate(
                  childDelegate: ListWheelChildLoopingListDelegate(
                    children: [
                      ChallengeType.beef,
                      ChallengeType.beef,
                      ChallengeType.flying,
                      ChallengeType.beef,
                      ChallengeType.beef,
                    ].map((type) {
                      return buildItem(context, type);
                    }).toList()
                  ),
                  itemExtent: _itemExtent,
                  physics: FixedExtentScrollPhysics(),
                )
              )
            ],
          ),
          Expanded(
            child: Container(
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: addButtonPadding),
            child: PrimaryActionButton(
              text: "Start challenge",
              emoji: "👌",
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          )
        ]
      ),
    );
  }

  Widget buildItem(BuildContext context, ChallengeType type) {
    return Container(
      width: double.infinity,
      height: _itemExtent,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: <Widget>[
            Image.asset(ChallengeMappings.imagePath(type),
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(ChallengeMappings.name(type, context),
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
