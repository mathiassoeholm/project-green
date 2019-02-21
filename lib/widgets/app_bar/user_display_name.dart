import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:project_green/appstate/app_state.dart';
import 'package:project_green/utility/number_utility.dart';
import 'package:project_green/widgets/app_bar/collapsed_builder.dart';
import 'package:redux/redux.dart';

class UserDisplayName extends StatelessWidget {
  final Stream<double> collapseFactorStream;

  const UserDisplayName({
    @required this.collapseFactorStream
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String>(
      converter: (Store<AppState> store) => store.state.user?.displayName,
      builder: (context, displayName) {
        if (displayName == null) {
          return Container(width: 0, height: 0);
        }

        return CollapsedBuilder(
          stream: collapseFactorStream,
          builder: (context, collapseFactor) {
            final bottomTextInterpolation = mapFromRange(collapseFactor,
                srcRange: [0.35, 0.5],
                destRange: [0.0, 1.0]
            );

            final topTextInterpolation = mapFromRange(collapseFactor,
                srcRange: [0.85, 1.0],
                destRange: [0.0, 1.0]
            );

            return Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: lerpDouble(110, 120, bottomTextInterpolation)),
                    child: Text(displayName,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 60, top: lerpDouble(0, 10.0, topTextInterpolation)),
                    child: Opacity(
                      opacity: topTextInterpolation,
                      child: Text(displayName,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
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
