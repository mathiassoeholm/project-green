import 'package:flutter/material.dart';
import 'package:project_green/challenges/challenge.dart';
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
              height: 110,
              color: ThemeValues.green,
            ),
            Positioned(
              left: 7, right: 0, top: 0, bottom: 0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(challenge.emoji,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                  )
                ),
              ),
            ),
            Positioned(
              left: 80, right: 0, top: 15, bottom: 0,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Avoid eating beef",
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ),
            Positioned(
              left: 80, right: 0, top: 60, bottom: 0,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("30 day streak",
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ),
            ),
            Positioned(
              width: 130, right: -40, top: -20, bottom: -20,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ThemeValues.greenDark,
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
      ),
    );
  }
}
