import 'package:flutter/material.dart';
import 'package:project_green/widgets/app_bar/user_circle_avatar.dart';
import 'package:project_green/widgets/app_bar/user_display_name.dart';

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
            child: UserCircleAvatar(
              collapseFactorStream: collapseFactorStream,
            ),
          ),
          Positioned.fill(
            child: UserDisplayName(
              collapseFactorStream: collapseFactorStream,
            ),
          ),
        ],
      ),
    );
  }
}
