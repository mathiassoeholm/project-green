import 'package:flutter/material.dart';
import 'package:project_green/challenges/challenge.dart';
import 'package:project_green/widgets/theme_values.dart';

class ChallengeCard extends StatelessWidget {
  final Challenge challenge;

  ChallengeCard(this.challenge);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 150.0,
        ),
        Positioned(
          left: 0.0,
          top: 40,
          right: 0,
          bottom: 10,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                new BoxShadow(
                  color: Colors.black26,
                  offset: new Offset(5.0, 10.0),
                  blurRadius: 10.0,
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              gradient: greenGradient,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          height: 150.0,
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(challenge.emoji,
              style: TextStyle(
                color: Colors.white,
                fontSize: 60,
              )
            ),
          ),
        )
      ],
    );
  }
}
