import 'package:flutter_test/flutter_test.dart';
import 'package:project_green/appstate/app_state.dart';
import 'package:project_green/appstate/app_state_reducer.dart';
import 'package:project_green/user/user.dart';
import 'package:project_green/user/user_actions.dart';
import 'package:redux/redux.dart';

main() {
  group('User Reducer', () {
    test('should set user info', () {
      final store = Store<AppState>(
        appStateReducer,
        initialState: AppState(),
      );

      expect(store.state.user, null);

      final user = User((b) => b
        ..displayName = 'john'
        ..photoURL = 'photo-url'
      );

      store.dispatch(SetUserAction(user));

      expect(store.state.user, user);
    });
  });
}