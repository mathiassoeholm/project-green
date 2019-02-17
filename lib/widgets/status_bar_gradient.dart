import 'package:flutter/material.dart';

/// Used to make the status bar more visible, when there's
/// a white status bar on a white background.
class StatusBarGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final safeAreaTop = MediaQuery.of(context).padding.top;

    return Container(
      height: safeAreaTop,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0x66000000),
            Color(0x11000000),
            Color(0x00000000),
          ],
          stops: [
            0.0,
            0.8,
            1.0,
          ]
        )
      ),
    );
  }
}
