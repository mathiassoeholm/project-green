import 'package:flutter/material.dart';
import 'package:project_green/widgets/app_bar/user_circle_avatar.dart';
import 'package:project_green/widgets/app_bar/user_display_name.dart';
import 'package:project_green/widgets/app_bar/user_rank.dart';
import 'package:project_green/widgets/app_bar/user_total_points.dart';
import 'package:project_green/widgets/home/home_values.dart';

class AppBarContent extends StatelessWidget {
  final Stream<double> collapseFactorStream;

  const AppBarContent({
    @required this.collapseFactorStream
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(left: false, right: false, bottom: false,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Color(0xAA000000),
                    Color(0x00000000),
                  ]
                ),
              ),
            )
          ),
          Positioned.fill(
            child: UserCircleAvatar(
              collapseFactorStream: collapseFactorStream,
            ),
          ),
          Positioned.fill(
            child: UserDisplayName(
              collapseFactorStream: collapseFactorStream,
            ),
          ),
          Positioned.fill(
            child: UserRank(
              collapseFactorStream: collapseFactorStream,
            ),
          ),
          Positioned.fill(
            child: UserTotalPoints(
              collapseFactorStream: collapseFactorStream,
            )
          ),
        ],
      ),
    );
  }
}
