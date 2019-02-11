import 'dart:async';

import 'package:project_green/appstate/app_state.dart';
import 'package:project_green/time/time_actions.dart';
import 'package:redux/redux.dart';

startTimeUpdater({
  Store<AppState> store,
  Duration interval,
}) {
  Timer.periodic(interval, (Timer timer) {

    final currentToday = store.state.time.today;
    final newToday = DateTime.now();

    if (currentToday.day != newToday.day
        || currentToday.month != newToday.month
        || currentToday.year != newToday.year) {
      store.dispatch(SetTodayAction(newToday));
    }
  });
}