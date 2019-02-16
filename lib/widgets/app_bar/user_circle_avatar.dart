import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_green/utility/number_utility.dart';

class UserCircleAvatar extends StatelessWidget {
  final Stream<double> collapseFactorStream;

  const UserCircleAvatar({
    @required this.collapseFactorStream
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return StreamBuilder<double>(
          stream: collapseFactorStream,
          builder: (context, snapshot) {
            var collapseFactor = snapshot.hasData
              ? snapshot.data
              : 0.0;

            final sizeCollapseFactor = set01RangeThreshold(collapseFactor,
                threshold: 0.1,
            );

            final posCollapseFactor = set01RangeThreshold(collapseFactor,
              threshold: 0.5,
            );

            final startPadding = 20.0;
            final endPadding = 7.0;
            final padding = lerpDouble(startPadding, endPadding, sizeCollapseFactor);

            final size = lerpDouble(94, 44, sizeCollapseFactor);
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
                      Container(
                        width: totalSize,
                        height: totalSize,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Positioned.fill(
                        child: Center(
                          child: Container(
                            width: size,
                            height: size,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage('https://www.cobdoglaps.sa.edu.au/wp-content/uploads/2017/11/placeholder-profile-sq.jpg'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
