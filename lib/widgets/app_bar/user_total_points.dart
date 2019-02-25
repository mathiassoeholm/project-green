import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:project_green/appstate/app_state.dart';
import 'package:project_green/utility/number_utility.dart';
import 'package:project_green/widgets/app_bar/collapsed_builder.dart';
import 'package:project_green/widgets/points_display.dart';
import 'package:project_green/widgets/theme_values.dart';
import 'package:redux/redux.dart';

class UserTotalPoints extends StatelessWidget {
  final Stream<double> collapseFactorStream;

  const UserTotalPoints({
    @required this.collapseFactorStream
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, int>(
      converter: (Store<AppState> store) => store.state.user?.totalPoints,
      builder: (context, totalPoints) {
        return CollapsedBuilder(
          stream: collapseFactorStream,
          builder: (context, collapseFactor) {
            final bottomInterpolation = mapFromRange(collapseFactor,
                srcRange: [0.0, 0.4],
                destRange: [0.0, 1.0]
            );

            var topInterpolation = mapFromRange(collapseFactor,
                srcRange: [0.5, 1.0],
                destRange: [0.0, 1.0]
            );

            topInterpolation = Curves.fastOutSlowIn.transform(topInterpolation);

            return Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: lerpDouble(155, 180, bottomInterpolation)),
                    child: PointsDisplay(
                      totalPoints: totalPoints,
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues((1-topInterpolation)*100.0, 0.0, 0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15, right: 7),
                      child: Opacity(
                        opacity: topInterpolation,
                        child: PointsDisplay(
                          totalPoints: totalPoints,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
