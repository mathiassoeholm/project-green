import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:project_green/appstate/app_state.dart';
import 'package:project_green/utility/number_utility.dart';
import 'package:project_green/widgets/app_bar/collapsed_builder.dart';
import 'package:redux/redux.dart';

class UserCircleAvatar extends StatelessWidget {
  final Stream<double> collapseFactorStream;

  Widget _avatar;

  UserCircleAvatar({
    @required this.collapseFactorStream
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String>(
      converter: (Store<AppState> store) => store.state.user?.photoURL,
      builder: (context, photoURL) {

        _avatar = _buildAvatar(photoURL);

        return LayoutBuilder(
          builder: (context, constraints) {
            return CollapsedBuilder(
              stream: collapseFactorStream,
              builder: (context, collapseFactor) {
                var sizeCollapseFactor = mapFromRange(collapseFactor,
                  srcRange: [0.5, 0.9],
                  destRange: [0.0, 1.0]
                );

                sizeCollapseFactor = Curves.linear.transform(sizeCollapseFactor);

                var posCollapseFactor = mapFromRange(collapseFactor,
                  srcRange: [0.4, 0.9],
                  destRange: [0.0, 1.0]
                );

                posCollapseFactor = Curves.fastOutSlowIn.transform(posCollapseFactor);

                final startPadding = 10.0;
                final endPadding = 7.0;
                final padding = lerpDouble(startPadding, endPadding, sizeCollapseFactor);

                final size = lerpDouble(94, 44, sizeCollapseFactor);
                final border = lerpDouble(4.0, 2.0, sizeCollapseFactor);

                return Align(
                  alignment: Alignment(-posCollapseFactor, -1),
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: Container(
                      width: size,
                      height: size,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(border),
                        child: _avatar,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildAvatar(String photoURL) {
    print('build avatar');

    if (photoURL == null) {
      return Container(
        width: 0, height: 0,
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(photoURL),
          ),
        ),
      );
    }
  }
}
