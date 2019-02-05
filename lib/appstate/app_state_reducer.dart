import 'package:project_green/appstate/app_state.dart';
import 'package:project_green/challenges/challenges_reducer.dart';

AppState appStateReducer(AppState state, action) {
  return AppState((b) => b
    ..challenges = challengesReducer(state.challenges, action).toBuilder()
  );
}