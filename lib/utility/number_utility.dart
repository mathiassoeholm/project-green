import 'dart:ui';

import 'package:meta/meta.dart';

double mapFromRange(double value, {
  @required List<double> srcRange,
  @required List<double> destRange,
}) {
  if (value < srcRange[0]) {
    return destRange[0];
  } else if (value > srcRange[1]) {
    return destRange[1];
  }

  double t = (value - srcRange[0])/(srcRange[1] - srcRange[0]);
  return lerpDouble(destRange[0], destRange[1], t);
}

bool approxEqual(double lhs, double rhs, { double epsilon = 0.0000001 }) {
  return (lhs - rhs).abs() < epsilon;
}