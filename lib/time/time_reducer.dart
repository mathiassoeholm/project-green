import 'package:project_green/time/time.dart';
import 'package:project_green/time/time_actions.dart';
import 'package:redux/redux.dart';

final timeReducer = combineReducers<Time>([
  TypedReducer<Time, SetTodayAction>(_setToday),
]);

Time _setToday(Time state, SetTodayAction action) {
  return state.rebuild((b) => b
    ..today = action.newDate
  );
}
