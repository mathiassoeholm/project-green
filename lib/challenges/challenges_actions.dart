import 'package:project_green/challenges/challenge.dart';

class AddChallengeAction {
  final Challenge newChallenge;

  AddChallengeAction(this.newChallenge);
}

class RemoveChallengeAction {
  final Challenge challenge;

  RemoveChallengeAction(this.challenge);
}