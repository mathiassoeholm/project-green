import 'package:flutter_test/flutter_test.dart';
import 'package:project_green/appstate/app_state.dart';
import 'package:project_green/appstate/app_state_reducer.dart';
import 'package:project_green/challenges/challenge.dart';
import 'package:project_green/challenges/challenge_type.dart';
import 'package:project_green/challenges/challenges_actions.dart';
import 'package:redux/redux.dart';

main() {
  group('Challenges Reducer', () {
    test('should create challenge', () {
      final store = Store<AppState>(
        appStateReducer,
        initialState: AppState(),
      );

      expect(store.state.challenges, []);

      final newChallenge = Challenge((b) => b
        ..type = ChallengeType.beef
        ..start = DateTime(2018, 12, 24)
      );

      store.dispatch(AddChallengeAction(newChallenge));

      expect(store.state.challenges, [newChallenge]);
    });
  });
}