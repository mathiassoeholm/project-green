import 'package:built_value/built_value.dart';

part 'time.g.dart';

abstract class Time implements Built<Time, TimeBuilder> {
  DateTime get today;

  Time._();
  factory Time([updates(TimeBuilder b)]) =>_$Time((b) => b
  // Default values:
    ..today = DateTime.now()
    ..update(updates)
  );
}