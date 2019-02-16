import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:project_green/challenges/challenge.dart';
import 'package:project_green/time/time.dart';
import 'package:project_green/user/user.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  BuiltList<Challenge> get challenges;

  Time get time;

  @nullable
  User get user;

  AppState._();
  factory AppState([updates(AppStateBuilder b)]) =>_$AppState((b) => b
    // Default values:
    ..challenges = BuiltList<Challenge>().toBuilder()
    ..time = Time().toBuilder()
    ..update(updates)
  );
}