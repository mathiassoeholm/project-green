import 'package:flutter_test/flutter_test.dart';
import 'package:project_green/appstate/app_state.dart';
import 'package:project_green/appstate/app_state_reducer.dart';
import 'package:project_green/time/time_actions.dart';
import 'package:redux/redux.dart';

main() {
  group('Time Reducer', () {
    test('should change day', () {
      final store = Store<AppState>(
        appStateReducer,
        initialState: AppState((b) => b
          ..time.today = DateTime(2019, 1, 1)
        ),
      );

      final newDay = DateTime(2019, 1, 2);

      store.dispatch(SetTodayAction(newDay));

      expect(store.state.time.today, newDay);
    });
  });
}