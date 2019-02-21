import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:project_green/appstate/app_state.dart';
import 'package:project_green/utility/number_utility.dart';
import 'package:project_green/widgets/app_bar/collapsed_builder.dart';
import 'package:redux/redux.dart';

class UserCircleAvatar extends StatelessWidget {
  final Stream<double> collapseFactorStream;

  const UserCircleAvatar({
    @required this.collapseFactorStream
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String>(
      converter: (Store<AppState> store) => store.state.user?.photoURL,
      builder: (context, photoURL) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return CollapsedBuilder(
              stream: collapseFactorStream,
              builder: (context, collapseFactor) {
                var sizeCollapseFactor = mapFromRange(collapseFactor,
                  srcRange: [0.5, 1.0],
                  destRange: [0.0, 1.0]
                );

                sizeCollapseFactor = Curves.linear.transform(sizeCollapseFactor);

                var posCollapseFactor = mapFromRange(collapseFactor,
                  srcRange: [0.5, 0.9],
                  destRange: [0.0, 1.0]
                );

                posCollapseFactor = Curves.fastOutSlowIn.transform(posCollapseFactor);

                final startPadding = 10.0;
                final endPadding = 7.0;
                final padding = lerpDouble(startPadding, endPadding, sizeCollapseFactor);

                final size = lerpDouble(86, 40, sizeCollapseFactor);
                final borderSize = size*0.06;
                final totalSize = size+borderSize*2;
                final translation = (-constraints.maxWidth/2+totalSize/2 + endPadding) * posCollapseFactor;

                return Transform(
                  transform: Matrix4.translationValues(translation, 0, 0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.all(padding),
                      child: Stack(
                        children: <Widget>[
                          _buildFrame(totalSize),
                          _buildAvatar(photoURL, size),
                        ],
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

  Widget _buildFrame(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildAvatar(String photoURL, double size) {
    if (photoURL == null) {
      return Container(
        width: 0, height: 0,
      );
    } else {
      return Positioned.fill(
        child: Center(
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(photoURL),
              ),
            ),
          ),
        ),
      );
    }
  }
}
