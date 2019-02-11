import 'package:flutter_test/flutter_test.dart';
import 'package:project_green/appstate/app_state.dart';
import 'package:project_green/appstate/app_state_reducer.dart';
import 'package:project_green/time/time_updater.dart';
import 'package:redux/redux.dart';

main() {
  group('Time Updater', () {
    final initialDate = DateTime(2010, 1, 1);

    test('time updater updates today to a later point in time', () async {
      final store = Store<AppState>(
        appStateReducer,
        initialState: AppState((b) => b
          ..time.today = initialDate
        ),
      );

      startTimeUpdater(
        store: store,
        interval: Duration.zero,
      );

      // Not a very good unit-testing practice,
      // but unfortunately the Timer used is hard to mock
      await Future.delayed(Duration(milliseconds: 10));

      expect(store.state.time.today.isAfter(initialDate), true);
    });
  });
}