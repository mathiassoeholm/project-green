import 'package:project_green/user/user.dart';
import 'package:project_green/user/user_actions.dart';
import 'package:redux/redux.dart';

final userReducer = combineReducers<User>([
  TypedReducer<User, SetUserAction>(_setUser),
]);

User _setUser(User state, SetUserAction action) {
  return action.user;
}
