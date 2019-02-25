import 'package:flutter/material.dart';
import 'package:project_green/widgets/theme_values.dart';

class PointsDisplay extends StatelessWidget {
  final int totalPoints;

  const PointsDisplay({
    this.totalPoints
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: ThemeValues.buttonDropShadow,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.filter_vintage,
              color: ThemeValues.green,
              size: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(totalPoints.toString(),
                style: TextStyle(
                    color: ThemeValues.green,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    fontFamily: 'Roboto'
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
