import 'package:flutter/material.dart';
import 'package:project_green/challenges/challenge.dart';
import 'package:project_green/widgets/theme_values.dart';

class ChallengeCard extends StatelessWidget {
  final Challenge challenge;

  ChallengeCard(this.challenge);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      child: Stack(
        children: <Widget>[
          Container(
            height: 110,
            decoration: BoxDecoration(
              boxShadow: [
                new BoxShadow(
                  color: Colors.black26,
                  offset: new Offset(5.0, 10.0),
                  blurRadius: 10.0,
                )
              ],
              gradient: greenGradient,
            ),
          ),
          Positioned(
            left: 10.0, right: 0, top: 0, bottom: 0,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(challenge.emoji,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                )
              ),
            ),
          ),
          Positioned(
            left: 70, right: 0, top: 15, bottom: 0,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text("Avoid eating beef"),
            ),
          ),
          Positioned(
            width: 130, right: -40, top: -20, bottom: -20,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black38,
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black26,
                    offset: new Offset(-3, 2),
                    blurRadius: 3,
                  )
                ],
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
    );
  }
}
