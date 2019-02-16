import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_green/utility/number_utility.dart';

class UserCircleAvatar extends StatelessWidget {
  static const collapseThreshold = 0.3;

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

            collapseFactor = set01RangeThreshold(collapseFactor,
                threshold: collapseThreshold,
            );

            final size = lerpDouble(100.0, 44, collapseFactor);
            final padding = lerpDouble(20.0, 7.0, collapseFactor);
            final translation = -constraints.maxWidth/2+size/2;

            return Transform(
              transform: Matrix4.translationValues(translation*collapseFactor, 0, 0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.all(padding),
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
            );
          },
        );
      },
    );
  }
}
