import 'package:flutter/material.dart';

// Source: https://stackoverflow.com/questions/51119795/how-to-remove-scroll-glow
class NoGlowScrollBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}