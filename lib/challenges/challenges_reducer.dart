import 'package:built_collection/built_collection.dart';
import 'package:project_green/challenges/challenge.dart';
import 'package:project_green/challenges/challenges_actions.dart';
import 'package:redux/redux.dart';

final challengesReducer = combineReducers<BuiltList<Challenge>>([
  TypedReducer<BuiltList<Challenge>, AddChallengeAction>(_addChallenge),
]);

BuiltList<Challenge> _addChallenge(BuiltList<Challenge> state, AddChallengeAction action) {
  return state.rebuild((b) => b
    ..add(action.newChallenge)
  );
}
