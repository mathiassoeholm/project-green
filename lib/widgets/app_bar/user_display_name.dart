import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:project_green/appstate/app_state.dart';
import 'package:project_green/utility/number_utility.dart';
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
        return StreamBuilder<double>(
          stream: collapseFactorStream,
          builder: (context, snapshot) {
            var collapseFactor = snapshot.hasData
              ? snapshot.data
              : 0.0;

            final paddingCollapseFactor = set01RangeThreshold(collapseFactor,
              threshold: 0.1,
            );

            var alignCollapseFactor = set01RangeThreshold(collapseFactor,
              threshold: 0.7,
            );

            final topPadding = lerpDouble(130, 7.0, paddingCollapseFactor);

            return Align(
              alignment: Alignment(-alignCollapseFactor, -1.0),
              child: Padding(
                padding: EdgeInsets.fromLTRB(62, topPadding, 62, 0),
                child: Text(displayName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
