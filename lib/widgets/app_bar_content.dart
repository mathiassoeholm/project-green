import 'package:flutter/material.dart';
import 'package:project_green/widgets/user_circle_avatar.dart';

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
            )
          ),
        ],
      ),
    );
  }
}
