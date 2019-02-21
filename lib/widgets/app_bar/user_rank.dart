import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:project_green/appstate/app_state.dart';
import 'package:project_green/user/user_mappings.dart';
import 'package:project_green/utility/number_utility.dart';
import 'package:project_green/widgets/app_bar/collapsed_builder.dart';
import 'package:redux/redux.dart';

class UserRank extends StatelessWidget {
  final Stream<double> collapseFactorStream;

  const UserRank({
    @required this.collapseFactorStream
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String>(
      converter: (Store<AppState> store) {
        final totalPoints = store.state.user?.totalPoints;

        return totalPoints == null
          ? null
          : UserMappings.getRank(totalPoints);
      },
      builder: (context, totalPoints) {
        if (totalPoints == null) {
          return Container(width: 0, height: 0);
        }

        return CollapsedBuilder(
          stream: collapseFactorStream,
          builder: (context, collapseFactor) {
            final bottomTextInterpolation = mapFromRange(collapseFactor,
                srcRange: [0.1, 0.85],
                destRange: [0.0, 1.0]
            );

            final topTextInterpolation = mapFromRange(collapseFactor,
                srcRange: [0.8, 1.0],
                destRange: [0.0, 1.0]
            );

            return Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: lerpDouble(130, 155, bottomTextInterpolation)),
                    child: Text(totalPoints,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 60, top: lerpDouble(50, 30.0, topTextInterpolation)),
                    child: Opacity(
                      opacity: topTextInterpolation,
                      child: Text(totalPoints,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
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
