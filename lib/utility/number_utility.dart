import 'package:meta/meta.dart';

double set01RangeThreshold(double value, { @required double threshold }) {
  if(value < threshold) {
    return 0.0;
  } else if (approxEqual(value, threshold)) {
    return 0.0;
  } else {
    return (value-threshold)*(1/(1.0-threshold));
  }
}

bool approxEqual(double lhs, double rhs, { double epsilon = 0.0000001 }) {
  return (lhs - rhs).abs() < epsilon;
}